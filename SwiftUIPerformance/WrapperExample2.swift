import SwiftUI

// pass down vmWrapper without any issue
struct WrapperExample2: View {
    @ObservedObject private var vmWrapper = FruitViewModelWrapper()
    
    var body: some View {
        VStack {
            ScrollView {
                TextField("Title", text: $vmWrapper.vm.title)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                
                FruitList(viewModel: vmWrapper.vm, vmWrapper: vmWrapper)
                
                Button("ADD New") {
                    vmWrapper.vm.addNewFruit()
                }
            }
            
            Text("WrapperExample2")
        }
        .padding()
    }
}

fileprivate struct RowView: View {
    let fruit: Fruit
    let vmWrapper: FruitViewModelWrapper
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(fruit.name)
                    .bold()
                Text(fruit.description)
            }
            
            Spacer()
            
            Button("UPDATE Title") {
                vmWrapper.vm.update()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .testBackground()
    }
}

fileprivate struct FruitList: View {
    @ObservedObject var viewModel: FruitViewModel
    let vmWrapper: FruitViewModelWrapper
    
    var body: some View {
        ForEach(viewModel.fruits, id: \.self) { fruit in
            RowView(fruit: fruit, vmWrapper: vmWrapper)
        }
    }
}

#Preview {
    WrapperExample2()
}
