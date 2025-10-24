import SwiftUI

struct TimePicker04: View {
    @State private var selectedTime: Date? = nil
    @State private var showDialog = false

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                if let time = selectedTime {
                    Text("Selected time: \(time.formatted(date: .omitted, time: .shortened))")
                        .font(.headline)
                } else {
                    Text("No time selected")
                        .foregroundColor(.gray)
                }

                Button("Pick Time") {
                    withAnimation { showDialog = true }
                }
                .buttonStyle(.borderedProminent)
            }

            if showDialog {
                _AnalogClockDialog(showDialog: $showDialog, selectedTime: $selectedTime)
                    .transition(.scale)
            }
        }
        .animation(.easeInOut, value: showDialog)
    }
}

//
// MARK: - Private Analog Clock Dialog
//
private struct _AnalogClockDialog: View {
    @Binding var showDialog: Bool
    @Binding var selectedTime: Date?

    @State private var hour: Int = 12
    @State private var minute: Int = 0
    @State private var selectingHour: Bool = true

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture { withAnimation { showDialog = false } }

            VStack(spacing: 20) {
                Text("Select Time")
                    .font(.headline)

                _AnalogClockView(hour: $hour, minute: $minute, selectingHour: $selectingHour)

                HStack {
                    Button("Cancel") { withAnimation { showDialog = false } }
                    Spacer()
                    Button("Done") {
                        let calendar = Calendar.current
                        let today = calendar.startOfDay(for: Date())
                        selectedTime = calendar.date(bySettingHour: hour, minute: minute, second: 0, of: today)
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
        .onAppear {
            if let time = selectedTime {
                let calendar = Calendar.current
                hour = calendar.component(.hour, from: time)
                minute = calendar.component(.minute, from: time)
            }
        }
    }
}

//
// MARK: - Analog Clock View
//
private struct _AnalogClockView: View {
    @Binding var hour: Int
    @Binding var minute: Int
    @Binding var selectingHour: Bool

    private let clockSize: CGFloat = 250

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 2)
                .foregroundColor(.gray.opacity(0.3))
                .frame(width: clockSize, height: clockSize)

            // Numbers
            ForEach(1...12, id: \.self) { h in
                _ClockNumberView(number: h, isSelected: h == hour, clockSize: clockSize)
            }

            _ClockHandView(hour: $hour, minute: $minute, selectingHour: $selectingHour, clockSize: clockSize)
        }
        .frame(width: clockSize, height: clockSize)
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    let center = CGPoint(x: clockSize / 2, y: clockSize / 2)
                    let vector = CGPoint(x: value.location.x - center.x, y: value.location.y - center.y)
                    var angle = atan2(vector.y, vector.x) * 180 / .pi
                    if angle < 0 { angle += 360 }

                    if selectingHour {
                        let newHour = Int((angle / 30).rounded()) % 12
                        hour = newHour == 0 ? 12 : newHour
                    } else {
                        minute = Int((angle / 6).rounded()) % 60
                    }
                }
                .onEnded { _ in
                    if selectingHour { selectingHour = false }
                }
        )
    }
}

//
// MARK: - Clock Number View
//
private struct _ClockNumberView: View {
    let number: Int
    let isSelected: Bool
    let clockSize: CGFloat

    var body: some View {
        let radius = clockSize / 2 - 20
        let angle = Double(number) / 12 * 2 * .pi - .pi / 2
        let x = clockSize / 2 + cos(angle) * radius
        let y = clockSize / 2 + sin(angle) * radius

        return Text("\(number)")
            .foregroundColor(isSelected ? .white : .primary)
            .frame(width: 28, height: 28)
            .background(
                (isSelected ? Color.accentColor : Color.clear)
                    .clipShape(Circle())
            )

            .position(x: x, y: y)
    }
}

//
// MARK: - Clock Hand View
//
private struct _ClockHandView: View {
    @Binding var hour: Int
    @Binding var minute: Int
    @Binding var selectingHour: Bool
    let clockSize: CGFloat

    var body: some View {
        let length = selectingHour ? clockSize / 2 * 0.6 : clockSize / 2 * 0.8
        let angle = selectingHour ? Double(hour % 12) * 30 : Double(minute) * 6

        return Rectangle()
            .fill(Color.accentColor)
            .frame(width: 2, height: length)
            .offset(y: -length / 2)
            .rotationEffect(.degrees(angle))
            .animation(.easeInOut, value: hour)
    }
}

#Preview {
    TimePicker04()
}

