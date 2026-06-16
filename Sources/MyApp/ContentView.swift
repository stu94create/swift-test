import SwiftUI

/// The single screen of the app: a title and a button that increments a counter.
///
/// Accessibility note: every interactive and informative element below has an
/// explicit VoiceOver label, and where it helps, a hint and a spoken value.
/// - `accessibilityLabel`  – what VoiceOver reads to identify the element.
/// - `accessibilityHint`   – what happens if you activate it.
/// - `accessibilityValue`  – the element's current value (here, the count).
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 40) {
            Text("Counter Demo")
                .font(.largeTitle)
                .bold()
                // Mark this as a heading so VoiceOver users can navigate by
                // headings and know this is the screen's title.
                .accessibilityAddTraits(.isHeader)
                .accessibilityLabel("Counter Demo, main screen title")

            // The live count. We combine the label and the number into one
            // element so VoiceOver announces "Current count, 3" as a unit
            // and re-announces it whenever the value changes.
            Text("Count: \(count)")
                .font(.title)
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Current count")
                .accessibilityValue("\(count)")

            Button {
                count += 1
            } label: {
                Text("Increment")
                    .font(.title2)
                    .padding()
            }
            .accessibilityLabel("Increment counter")
            .accessibilityHint("Increases the count by one")
            // Keep the spoken value on the button in sync too, so a VoiceOver
            // user hears the new total right after activating the button.
            .accessibilityValue("\(count)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
