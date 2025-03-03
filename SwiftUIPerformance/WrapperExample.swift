import SwiftUI

struct WrapperExample: View {
  @ObservedObject
  private var vmWrapper = FruitViewModelWrapper()
  
  var body: some View {
    VStack {
      ScrollView {
        TextField("Title", text: $vmWrapper.vm.title)
          .textFieldStyle(.roundedBorder)
          .multilineTextAlignment(.center)
        
//        ForEach(vmWrapper.vm.fruits, id: \.self) { fruit in
//          RowView(fruit: fruit, action: vmWrapper.vm.update)
//        }
        FruitList(viewModel: vmWrapper.vm)
        
        Button("ADD New") {
          vmWrapper.vm.addNewFruit()
        }
      }
      
      Text("WrapperExample")
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
      
      Button("UPDATE") {
        action()
      }
      .buttonStyle(.borderedProminent)
    }
    .padding()
    .testBackground()
  }
}

fileprivate struct FruitList: View {
  @ObservedObject
  var viewModel: FruitViewModel
  
  var body: some View {
    ForEach(viewModel.fruits, id: \.self) { fruit in
      RowView(fruit: fruit, action: viewModel.update)
    }
  }
}

#Preview {
  WrapperExample()
}
