import SwiftUI

struct IdentityView: View {
    @StateObject private var viewModel = FruitViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                
                ForEach(viewModel.fruits, id: \.self) { fruit in
                    RowView(fruit: fruit)
                }
                
                Button("ADD New") {
                    viewModel.addNewFruit()
                }
            }
            
            List {
                ForEach($viewModel.fruits, id: \.self) { $fruit in
                    TextField("description", text: $fruit.description)
                }
            }
            .frame(height: 200)
            
            Text("IdentityView")
        }
        .padding()
    }
}

fileprivate struct RowView: View {
    let fruit: Fruit
    
    var body: some View {
        let _ = Self._printChanges() // might show @self changed
        
        HStack {
            VStack(alignment: .leading) {
                Text(fruit.name)
                    .bold()
                Text(fruit.description)
            }
            
            Spacer()
        }
        .padding()
        .testBackground()
        .testAnimatedBackground()
    }
}

#Preview {
    IdentityView()
}
