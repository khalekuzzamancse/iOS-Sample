import SwiftUI
import CoreUI
import UIKit

#Preview{
    GridView()
}
struct GridView:View {
    
    var body: some View {
        ScrollView{
            VStack(
                
            ){
                TextH2(text: "Visualize")
                    .fillMaxWidth(alignment: .leading)
                _NavigationItems()
                _NavigationItems()
                _NavigationItems()
                
            }
            .padding()
            .fillMaxHeight(alignment:.top)
        }
    }
}


struct _NavigationItems: View {
    let items = [
        _GridItemData("photo.badge.magnifyingglass","Linear Search" ),
        _GridItemData("photo.badge.magnifyingglass","Binary Search" ),
        _GridItemData("arrow.up.arrow.down.square","Bubble Sort" ),
        _GridItemData("rectangle.and.hand.point.up.left","Selection Sort" ),
        _GridItemData("arrow.down.backward.toptrailing.rectangle","Insertion Sort" ),
        _GridItemData("arrow.left.and.right.square","Quick Sort" ),
    ]
    
    var body: some View {
    
      
        EqualWidthRowLayout{
            ForEach(items) { item in
             
                    _GridItem(item: item) { }
    
                  
            }
            
        }
     }
       
        
    }







struct _GridItemData:Identifiable{
    var id: String { name }
    let icon:String
    let name:String
    init(_ icon: String, _ name: String) {
        self.icon = icon
        self.name = name
        
    }
    
}
struct _GridItem: View {
    let item: _GridItemData
    let onClick: ()->Void
    var body: some View {
        
        HStack{
            IconView(icon: item.icon, size: 30,tint: .white)
            SpacerHorizontal(4)
            TextView(text: item.name,color: .white)
        }
        .padding(8)
        .fillMaxWidth()
        .background(
            RoundedRectShape(radius:12, color:.blue)
        )
       
    }
}




struct CustomLayout:Layout{
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        
        let maxWidthAvailable = proposal.width ?? .infinity
               
               // Step 1: Find the maximum width among ALL children
               let maxChildWidth = subviews.map { subview in
                   subview.sizeThatFits(.unspecified).width
               }.max() ?? 0
        
        
        return CGSize.zero
    
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        
    }
    
    
}
struct EqualWidthRowLayout: Layout {
    var spacing: CGFloat = 12

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidthAvailable = proposal.width ?? .infinity
        
        // Step 1: Find the maximum width among ALL children
        let maxChildWidth = subviews.map { subview in
            subview.sizeThatFits(.unspecified).width
        }.max() ?? 0
        
        // Step 2: Calculate how many children can fit in a row
        let itemsPerRow = calculateItemsPerRow(
            maxWidthAvailable: maxWidthAvailable,
            itemWidth: maxChildWidth,
            spacing: spacing
        )
        
        // Step 3: Calculate total height based on equal-width layout
        let totalRows = ceil(CGFloat(subviews.count) / CGFloat(itemsPerRow))
        let rowHeight = calculateRowHeight(subviews: subviews, itemWidth: maxChildWidth)
        let totalHeight = totalRows * rowHeight + (totalRows - 1) * spacing
        
        return CGSize(width: maxWidthAvailable, height: totalHeight)
    }
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let maxWidthAvailable = bounds.width
        
        let maxChildWidth = subviews.map { $0.sizeThatFits(.unspecified).width }.max() ?? 0
        let itemsPerRow = calculateItemsPerRow(maxWidthAvailable: maxWidthAvailable, itemWidth: maxChildWidth, spacing: spacing)
        let totalSpacing = CGFloat(itemsPerRow - 1) * spacing
        let availableForItems = maxWidthAvailable - totalSpacing
        let itemWidth = min(maxChildWidth, availableForItems / CGFloat(itemsPerRow))
        let rowHeight = calculateRowHeight(subviews: subviews, itemWidth: itemWidth)
        
        var y = bounds.minY
        var currentIndex = 0
        var lastShift: CGFloat = 0 // Track the shift from the last fully-filled row
        
        while currentIndex < subviews.count {
            let rowEndIndex = min(currentIndex + itemsPerRow, subviews.count)
            let rowSubviews = Array(subviews[currentIndex..<rowEndIndex])
            
            let totalRowWidth = CGFloat(rowSubviews.count) * itemWidth + CGFloat(rowSubviews.count - 1) * spacing
            
            // Compute shift only if row is fully filled, otherwise reuse lastShift
            let shift: CGFloat
            if rowSubviews.count == itemsPerRow {
                shift = (maxWidthAvailable - totalRowWidth) / 2
                lastShift = shift
            } else {
                shift = lastShift
            }
            
            var x = bounds.minX + shift
            
            for subview in rowSubviews {
                let childSize = subview.sizeThatFits(ProposedViewSize(width: itemWidth, height: nil))
                
                subview.place(
                    at: CGPoint(x: x, y: y),
                    proposal: ProposedViewSize(width: itemWidth, height: childSize.height)
                )
                x += itemWidth + spacing
            }
            
            y += rowHeight + spacing
            currentIndex += itemsPerRow
        }
    }




    
    private func calculateItemsPerRow(maxWidthAvailable: CGFloat, itemWidth: CGFloat, spacing: CGFloat) -> Int {
        guard itemWidth > 0 else { return 1 }
        
        // Calculate how many items can fit considering spacing
        let itemsWithoutSpacing = Int(floor(maxWidthAvailable / itemWidth))
        let itemsWithSpacing = Int(floor((maxWidthAvailable + spacing) / (itemWidth + spacing)))
        
        // Use the more conservative estimate that accounts for spacing
        return max(1, itemsWithSpacing)
    }
    
    private func calculateRowHeight(subviews: Subviews, itemWidth: CGFloat) -> CGFloat {
        return subviews.map { subview in
            subview.sizeThatFits(ProposedViewSize(width: itemWidth, height: nil)).height
        }.max() ?? 0
    }
}
