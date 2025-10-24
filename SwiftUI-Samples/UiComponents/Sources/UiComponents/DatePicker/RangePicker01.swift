
import SwiftUI

#Preview {
    
    DateRangePicker01()
}

struct DateRangePicker01: View {
    @State private var range: ClosedRange<Date> = {
        let now = Date()
        let threeDaysAgo = Calendar.current.date(byAdding: .day, value: -3, to: now)!
        return threeDaysAgo...now
    }()
    
    @State private var showDialog = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("Selected range:")
                Text("\(range.lowerBound.formatted(date: .abbreviated, time: .omitted)) → \(range.upperBound.formatted(date: .abbreviated, time: .omitted))")
                    .font(.headline)
                
                Button("Pick date range") {
                    withAnimation { showDialog = true }
                }
                .buttonStyle(.borderedProminent)
            }
            
            if showDialog {
                DateRangePickerDialog(
                    showDialog: $showDialog,
                    range: $range
                )
                .transition(.scale)
            }
        }
        .animation(.easeInOut, value: showDialog)
    }
}

//
// MARK: - DateRangePickerDialog
//
struct DateRangePickerDialog: View {
    @Binding var showDialog: Bool
    @Binding var range: ClosedRange<Date>
    
    // Disable tomorrow and beyond
    private var dateRangeLimit: ClosedRange<Date> {
        let distantPast = Date.distantPast
        let today = Calendar.current.startOfDay(for: Date())
        return distantPast...today
    }
    
    var body: some View {
        ZStack {
            DialogBackground { withAnimation { showDialog = false } }
            
            VStack(spacing: 20) {
                Text("Select Date Range")
                    .font(.headline)
                
                // Custom range picker
                DateRangePickerView(
                    range: $range,
                    validRange: dateRangeLimit
                )
                
                DialogButtons(
                    onCancel: { withAnimation { showDialog = false } },
                    onDone: { withAnimation { showDialog = false } }
                )
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 10)
            .frame(maxWidth: 350)
        }
    }
}

//
// MARK: - DateRangePickerView
//
struct DateRangePickerView: View {
    @Binding var range: ClosedRange<Date>
    var validRange: ClosedRange<Date>
    
    var body: some View {
        VStack(spacing: 12) {
            DatePicker(
                "Start Date",
                selection: Binding(
                    get: { range.lowerBound },
                    set: { range = $0...range.upperBound }
                ),
                in: validRange,
                displayedComponents: [.date]
            )
            
            DatePicker(
                "End Date",
                selection: Binding(
                    get: { range.upperBound },
                    set: { range = range.lowerBound...$0 }
                ),
                in: validRange,
                displayedComponents: [.date]
            )
        }
        .datePickerStyle(.compact)
    }
}

//
// MARK: - Reused Components
//
private struct DialogBackground: View {
    var onTap: () -> Void
    var body: some View {
        Color.black.opacity(0.4)
            .ignoresSafeArea()
            .onTapGesture(perform: onTap)
    }
}

private struct DialogButtons: View {
    var onCancel: () -> Void
    var onDone: () -> Void
    var body: some View {
        HStack {
            Button("Cancel", action: onCancel)
            Spacer()
            Button("Done", action: onDone)
        }
    }
}
