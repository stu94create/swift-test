import SwiftUI

// The @main attribute marks this struct as the app's entry point —
// the first thing iOS runs when the app launches.
@main
struct MyApp: App {
    var body: some Scene {
        // A WindowGroup is the container that holds your app's UI.
        // ContentView is the first (and here, only) screen shown.
        WindowGroup {
            ContentView()
        }
    }
}
