import SwiftUI

/*
 Button("Swap 0 and 1") {
     let ctrl = controller  // capture safely
     Task {
         await ctrl.swap(i: 0, j: 1, delay: 0.3)
     }
 }
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
 */
struct ArrayView:View {
    @StateObject var controller = ArrayControllerImpl(
        itemLabels: ["A", "B", "C", "D"],
        pointerLabels: ["i", "j"]
    )
    var body: some View {
        _ArrayView(controller: controller)
       
            
    }
}

struct _ArrayView: View {
    @ObservedObject var controller: ArrayControllerImpl
//    @StateObject var controller = ArrayControllerImpl(
//        itemLabels: ["A", "B", "C", "D"],
//        pointerLabels: ["i", "j"]
//    )
    var body: some View {
      
            CustomHStackLayout(
                spacing: 8,
                visibleCount: 4,
                onChildPositions: { positions in
                    positions.enumerated().forEach { index, frame in
                        let center = CGPoint(x: frame.midX, y: frame.midY)
                        print("Cell \(index) position: x=\(frame.origin.x), y=\(frame.origin.y)")
                        controller.onCellPositionChanged(index: index, position: center)
                    }
                    
                },
                
            ){
                ForEach(controller.cells.indices, id: \.self) { index in
                    CellView(
                        size: 64,
                        color: controller.cells[index].color,
                        borderColor: .gray
                    )
                }
                ForEach(controller.elements.indices, id: \.self) { index in
                    ElementView(
                        label: controller.elements[index].label,
                        color: controller.elements[index].color,
                        size: 64
                    )
                    .position(
                           x: controller.elements[index].position.x,
                           y: controller.elements[index].position.y-64
                       )

                    
                }
            
        }
        
            
    
    }
}



struct VisualArrayView: View {
    @ObservedObject var controller: ArrayControllerImpl
    let cellSize: CGFloat = 64
    
    var body: some View {
        ZStack {
            // Cells
            HStack(spacing: 8) {
                ForEach(controller.cells.indices, id: \.self) { index in
                    CellView(
                        size: cellSize,
                        color: controller.cells[index].color,
                        borderColor: .gray,
                      
                    )
                }
            }
            
            // Elements
            ForEach(controller.elements.indices, id: \.self) { index in
                ElementView(
                    label: controller.elements[index].label,
                    color: controller.elements[index].color,
                    size: cellSize
                )
                  .position(x:0,y:0)
                
            }.onAppear {
                
                print("Elements: \(controller.elements)")
            }

        }
        .coordinateSpace(name: "parent")
       
    }
}


struct ElementView: View {
    let label: String
    let color: Color
    let size: CGFloat
    
    var body: some View {
        Circle()
            .fill(color == .clear ? .teal : color)
            .frame(width: size, height: size)
            .overlay(Text(label).foregroundColor(.white))
    }
}

struct PointerView: View {
    let label: String
    let color: Color
    let size: CGFloat
    
    var body: some View {
        Rectangle()
            .fill(Color.orange.opacity(0.4))
            .frame(width: size, height: size)
            .overlay(
                Text(label).foregroundColor(color).font(.caption),
                alignment: .bottom
            )
    }
}



struct CellView: View {
    let size: CGFloat
    let color: Color
    let borderColor: Color?
//    let onPositionChanged: (CGPoint) -> Void
    
    var body: some View {
        Rectangle()
            .fill(color)
            .overlay(
                Rectangle()
                    .stroke(borderColor ?? .clear,
                            lineWidth: borderColor == nil ? 0 : 1)
            )
            .frame(width: size, height: size)
//            .background(
//                GeometryReader { geo in
//                    Color.clear
//                        .onAppear {
//                            let origin = geo.frame(in: .named("arraySpace")).origin
//                            onPositionChanged(origin)
//                        }
//                        .onChange(of: geo.frame(in: .named("arraySpace")).origin) { newOrigin in
//                            onPositionChanged(newOrigin)
//                        }
//                }
//            )
    }
}

struct CustomHStackLayout: Layout {
    var spacing: CGFloat
    var visibleCount: Int? = nil  // number of children to lay out / report
    var onChildPositions: (([CGRect]) -> Void)? = nil

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let count = visibleCount ?? subviews.count
        var x: CGFloat = 0
        var maxHeight: CGFloat = 0

        for subview in subviews.prefix(count) {
            let size = subview.sizeThatFits(.unspecified)
            x += size.width
            if subview != subviews.prefix(count).last { x += spacing }
            maxHeight = max(maxHeight, size.height)
        }

        return CGSize(width: x, height: maxHeight)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let count = visibleCount ?? subviews.count
        var x: CGFloat = bounds.minX
        var childFrames: [CGRect] = []

        for subview in subviews.prefix(count) {
            let size = subview.sizeThatFits(.unspecified)
            let frame = CGRect(x: x, y: bounds.minY, width: size.width, height: size.height)
            subview.place(at: frame.origin, proposal: ProposedViewSize(width: size.width, height: size.height))
            childFrames.append(frame)
            x += size.width + spacing
        }

        onChildPositions?(childFrames)
    }
}
