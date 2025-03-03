import SwiftUI

struct ObservationView: View {
  @Bindable
  var model = FruitObservation()
  
  var body: some View {
    VStack {
      ScrollView {
        TextField("Title", text: $model.title)
          .textFieldStyle(.roundedBorder)
          .multilineTextAlignment(.center)
        
        ForEach(model.fruits, id: \.self) { fruit in
          RowView(fruit: fruit, model: model)
        }
        
        Button("ADD New") {
          model.addNewFruit()
        }
      }
      
      List {
        Section("description") {
          ForEach($model.fruits, id: \.name) { $fruit in
            TextField("description", text: $fruit.description)
          }
        }
        
        Section("Date") {
          TextField("date", text: $model.date)
        }
      }
      
      Text("ObservationView")
    }
    .padding()
  }
}

fileprivate struct RowView: View {
  let fruit: Fruit
  let model: FruitObservation
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(fruit.name)
          .bold()
        Text(fruit.description)
//        Text(model.date)
        DateView(model: model)
      }
      
      Spacer()
      
      Button("UPDATE") {
        model.update()
      }
      .buttonStyle(.borderedProminent)
    }
    .padding()
    .testBackground()
  }
}

fileprivate struct DateView: View {
  let model: FruitObservation
  
  var body: some View {
    Text(model.date)
  }
}

#Preview {
  ObservationView()
}
