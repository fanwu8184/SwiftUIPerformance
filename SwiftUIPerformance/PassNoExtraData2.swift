import SwiftUI

struct PassNoExtraData2: View {
    @StateObject private var viewModel = FruitViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                
                ForEach(viewModel.fruits, id: \.name) { fruit in
//                    RowView(name: fruit.name, action: viewModel.update, viewModel: viewModel)
                    RowView(name: fruit.name, action: viewModel.update)
                }
            }
            
            List {
                Section("Date") {
                    TextField("date", text: $viewModel.date)
                }
            }
            
            Text("PassNoExtraData2")
        }
        .padding()
        .environmentObject(viewModel)
    }
}

fileprivate struct RowView: View {
    let name: String
    let action: () -> Void
//    @ObservedObject var viewModel: FruitViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .bold()
                    .modifier(CustomViewModifier())
                
//                Text(viewModel.date)
                DateView()
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

fileprivate struct DateView: View {
    @EnvironmentObject var viewModel: FruitViewModel
    
    var body: some View {
        Text(viewModel.date)
    }
}

fileprivate struct CustomViewModifier: ViewModifier {
    @EnvironmentObject var viewModel: FruitViewModel
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                viewModel.update()
            }
    }
}

#Preview {
    PassNoExtraData2()
}
