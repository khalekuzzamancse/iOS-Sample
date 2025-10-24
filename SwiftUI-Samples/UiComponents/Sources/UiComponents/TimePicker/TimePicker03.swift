//
//  TimePicker03.swift
//  SwiftUIConcept
//
//  Created by Md Khalekuzzaman on 10/18/25.
//


import SwiftUI

struct TimePicker03: View {
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
                _ClockTimeDialog(showDialog: $showDialog, selectedTime: $selectedTime)
                    .transition(.scale)
            }
        }
        .animation(.easeInOut, value: showDialog)
    }
}

private struct _ClockTimeDialog: View {
    @Binding var showDialog: Bool
    @Binding var selectedTime: Date?

    @State private var tempTime: Date = Date()

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture { withAnimation { showDialog = false } }

            VStack(spacing: 20) {
                Text("Select Time")
                    .font(.headline)

                DatePicker(
                    "",
                    selection: $tempTime,
                    displayedComponents: [.hourAndMinute]
                )
                .datePickerStyle(.graphical) // triggers circular clock style
                .labelsHidden()
                .frame(maxHeight: 300)

                HStack {
                    Button("Cancel") { withAnimation { showDialog = false } }
                    Spacer()
                    Button("Done") {
                        selectedTime = tempTime
                        withAnimation { showDialog = false }
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 10)
            .frame(maxWidth: 300)
        }
        .onAppear {
            if let existingTime = selectedTime {
                tempTime = existingTime
            }
        }
    }
}

#Preview {
    TimePicker03()
}
