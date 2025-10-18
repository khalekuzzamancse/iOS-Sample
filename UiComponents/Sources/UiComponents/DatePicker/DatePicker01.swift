import SwiftUI

struct DatePicker01: View {
    @State private var date = Date()
    @State private var showDialog = false

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("Selected date: \(date.formatted(date: .abbreviated, time: .omitted))")
                    .font(.headline)

                Button("Pick a date") {
                    withAnimation { showDialog = true }
                }
                .buttonStyle(.borderedProminent)
            }

            if showDialog {
                DatePickerDialog(
                    showDialog: $showDialog,
                    date: $date
                )
                
            }
        }
        .animation(.easeInOut, value: showDialog)
    }
}



private struct DatePickerDialog: View {
    @Binding var showDialog: Bool
    @Binding var date: Date

    var body: some View {
        ZStack {
            DialogBackground { withAnimation { showDialog = false } }

            VStack(spacing: 20) {
                Text("Select a Date")
                    .font(.headline)

                DatePicker(
                    "",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .labelsHidden()

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


#Preview {
    DatePicker01()
}
 
