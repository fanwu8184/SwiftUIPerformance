import SwiftUI

struct ProblemView: View {
  @StateObject
  private var viewModel = FruitViewModel()
  
  var body: some View {
    VStack {
      ScrollView {
        TextField("Title", text: $viewModel.title)
          .textFieldStyle(.roundedBorder)
          .multilineTextAlignment(.center)
        
        ForEach(viewModel.fruits, id: \.self) { fruit in
          RowView(fruit: fruit, viewModel: viewModel)
        }
        
        Button("ADD New") {
          viewModel.addNewFruit()
        }
      }
      
      Text("ProblemView")
    }
    .padding()
  }
}

fileprivate struct RowView: View {
  let fruit: Fruit
  @ObservedObject
  var viewModel: FruitViewModel
  
  var body: some View {
//    let _ = Self._printChanges()
    
    HStack {
      VStack(alignment: .leading) {
        Text(fruit.name)
          .bold()
        Text(fruit.description)
      }
      
      Spacer()
      
      Button("UPDATE") {
//        viewModel.update()
      }
      .buttonStyle(.borderedProminent)
    }
    .padding()
    .testBackground()
  }
}

#Preview {
  ProblemView()
}
