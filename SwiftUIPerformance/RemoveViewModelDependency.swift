import SwiftUI

struct RemoveViewModelDependency: View {
    @StateObject private var viewModel = FruitViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                
                ForEach(viewModel.fruits, id: \.self) { fruit in
                    RowView(fruit: fruit, action: viewModel.update)
//                    RowView(fruit: fruit) { // this way doesn't solve the problem
//                        viewModel.update()
//                    }
                }
                
                Button("ADD New") {
                    viewModel.addNewFruit()
                }
            }
            
            Text("RemoveViewModelDependency")
        }
        .padding()
    }
}

fileprivate struct RowView: View {
    let fruit: Fruit
    let action: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(fruit.name)
                    .bold()
                Text(fruit.description)
            }
            
            Spacer()
            
            Button("UPDATE Title") {
                action()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .testBackground()
    }
}

#Preview {
    RemoveViewModelDependency()
}
