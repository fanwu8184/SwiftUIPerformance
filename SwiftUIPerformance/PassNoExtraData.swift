import SwiftUI

struct PassNoExtraData: View {
    @StateObject private var viewModel = FruitViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                
                ForEach(viewModel.fruits, id: \.name) { fruit in
                    RowView(fruit: fruit, action: viewModel.update)
//                    RowView(name: fruit.name, action: viewModel.update)
                }
            }
            
            List {
                ForEach($viewModel.fruits, id: \.name) { $fruit in
                    TextField("description", text: $fruit.description)
                }
            }
            
            Text("PassNoExtraData")
        }
        .padding()
    }
}

fileprivate struct RowView: View {
    let fruit: Fruit
//    let name: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            Text(fruit.name)
                .bold()
            
//            Text(name)
//                .bold()
            
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
    PassNoExtraData()
}
