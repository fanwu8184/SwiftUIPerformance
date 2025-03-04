import SwiftUI

// References:
// Youtuber: Karin Prater
// SwiftUI Performance Optimisation: How to manage Data Flow and UI Updates in your iOS and macOS apps https://www.youtube.com/watch?v=yvfv6N60-vY
// The Essentials of SwiftUI View Identity: How to Ensure Reliable View Updates Across Your iOS Apps https://www.youtube.com/watch?v=tRp6I3epizk
// From Slow to Fast: Profiling SwiftUI Applications for Peak Performance - SwiftUI Testing Tutorial 1 https://www.youtube.com/watch?v=aH15GUzk85Y

struct ContentView: View {
    var body: some View {
        TabView {
            ProblemView()
                .tabItem {
                    Label("1", systemImage: "list.dash")
                }
            
            RemoveViewModelDependency()
                .tabItem {
                    Label("2", systemImage: "list.dash")
                }
            
            IdentityView()
                .tabItem {
                    Label("3", systemImage: "list.dash")
                }
        }
    }
}

#Preview {
    ContentView()
}
