import SwiftUI

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
