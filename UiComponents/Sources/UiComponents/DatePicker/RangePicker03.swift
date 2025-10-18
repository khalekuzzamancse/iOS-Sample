
import SwiftUI

#Preview{
    
    DateRangePicker03()
}



struct DateRangePicker03: View {
    @State private var selectedRange: ClosedRange<Date>?
    @State private var showDialog = false

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                if let range = selectedRange {
                    Text("Range: \(range.lowerBound.formatted(date: .abbreviated, time: .omitted)) → \(range.upperBound.formatted(date: .abbreviated, time: .omitted))")
                        .font(.headline)
                } else {
                    Text("No range selected")
                        .foregroundColor(.gray)
                }

                Button("Pick Range") {
                    withAnimation { showDialog = true }
                }
                .buttonStyle(.borderedProminent)
            }

            if showDialog {
                _RangeDialog(
                    showDialog: $showDialog,
                    selectedRange: $selectedRange
                )
                .transition(.scale)
            }
        }
        .animation(.easeInOut, value: showDialog)
    }
}

//
// MARK: - Private Dialog
//

private struct _RangeDialog: View {
    @Binding var showDialog: Bool
    @Binding var selectedRange: ClosedRange<Date>?

    // generate days for the currently visible month (use Date() for current month)
    private let days = Calendar.current.generateDays(for: Date())

    @State private var tempRange: ClosedRange<Date>? = nil

    // valid range: disallow tomorrow and beyond
    private var validRange: ClosedRange<Date> {
        let today = Calendar.current.startOfDay(for: Date())
        return Date.distantPast...today
    }

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture { withAnimation { showDialog = false } }

            VStack(spacing: 16) {
                Text("Select Range")
                    .font(.headline)

                _CalendarGrid(
                    days: days,
                    selectedRange: tempRange,
                    validRange: validRange,
                    onSelect: { day in
                        // ignore taps outside valid range
                        guard validRange.contains(day) else { return }

                        if let current = tempRange {
                            // If we already have a start and end equal, expand/replace end
                            if current.lowerBound == current.upperBound {
                                // set new range between start and tapped day
                                let start = current.lowerBound
                                tempRange = min(start, day)...max(start, day)
                            } else {
                                // start new range at tapped day
                                tempRange = day...day
                            }
                        } else {
                            // no tempRange yet: set start
                            tempRange = day...day
                        }
                    }
                )

                HStack {
                    Button("Cancel") {
                        withAnimation { showDialog = false }
                    }
                    Spacer()
                    Button("Done") {
                        selectedRange = tempRange
                        withAnimation { showDialog = false }
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 10)
            .frame(maxWidth: 340)
        }
        .onAppear { tempRange = selectedRange }
    }
}

//
// MARK: - Calendar Grid
//

private struct _CalendarGrid: View {
    let days: [Date]
    let selectedRange: ClosedRange<Date>?
    let validRange: ClosedRange<Date>
    let onSelect: (Date) -> Void

    private let columns = Array(repeating: GridItem(.flexible()), count: 7)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(days, id: \.self) { day in
                let dayNumber = Calendar.current.component(.day, from: day)
                let isSelected = selectedRange?.contains(day) == true
                let isDisabled = !validRange.contains(day)

                Text("\(dayNumber)")
                    .frame(width: 36, height: 36)
                    .background(background(for: day, selected: isSelected))
                    .foregroundColor(foregroundColor(isSelected: isSelected, disabled: isDisabled))
                    .clipShape(Circle())
                    .onTapGesture {
                        if !isDisabled { onSelect(day) }
                    }
                    .opacity(isDisabled ? 0.4 : 1.0)
            }
        }
        .padding(.vertical, 8)
    }

    private func background(for day: Date, selected: Bool) -> some View {
        Group {
            if selected {
                // Use your custom selected color here
                Color.accentColor
            } else {
                Color.clear
            }
        }
    }

    private func foregroundColor(isSelected: Bool, disabled: Bool) -> Color {
        if disabled { return .gray }
        return isSelected ? .white : .primary
    }
}

//
// MARK: - Calendar Helper
//

private extension Calendar {
    /// Generate every date for the month that contains `for date`
    func generateDays(for date: Date) -> [Date] {
        guard let monthInterval = self.dateInterval(of: .month, for: date) else { return [] }

        // We might want to pad the grid so the first day falls in correct weekday column.
        // For simplicity return every date in the month (start..end)
        var days: [Date] = []
        var current = monthInterval.start
        while current < monthInterval.end {
            days.append(current)
            current = self.date(byAdding: .day, value: 1, to: current)!
        }
        return days
    }
}

