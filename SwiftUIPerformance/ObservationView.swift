import SwiftUI

struct ObservationView: View {
    let model = FruitObservation()
//    @State var model = FruitObservation()
    
    var body: some View {
        VStack {
            ScrollView {
//                TextField("Title", text: $model.title)
//                    .textFieldStyle(.roundedBorder)
//                    .multilineTextAlignment(.center)
                
                ForEach(model.fruits, id: \.self) { fruit in
                    RowView(fruit: fruit, model: model)
                }
                
                Button("ADD New") {
                    model.addNewFruit()
                }
            }
            
            List {
                TextEditSession(model: model)
                
//                Section("Date") {
//                    TextField("date", text: $model.date)
//                }
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
                /*
                 View Hierarchy
                 In this case, the Text(model.date) is directly embedded in the RowView’s body. When model.date changes, SwiftUI detects that something in RowView’s body depends on model.date. However, SwiftUI doesn’t inherently know how to isolate just the Text(model.date) view for an update. Instead, it considers the entire body of RowView as potentially affected by the change. As a result, it recalculates and redraws the entire RowView, even though only the Text(model.date) content has changed.
                 This happens because RowView is treated as a single unit, and SwiftUI doesn’t automatically "split" the view into smaller, independently updatable pieces unless you explicitly help it do so.

                 In DateView version, When model.date changes, SwiftUI evaluates the view hierarchy differently:
                 RowView’s body now contains a reference to DateView(model: model).

                 DateView is its own independent View with its own body, which depends on model.date.

                 Because DateView is a separate struct, SwiftUI can treat it as an isolated component in the view hierarchy. When model.date changes, SwiftUI recognizes that only DateView’s body needs to be recomputed and redrawn, not the entire RowView. This is an optimization SwiftUI applies: it updates the smallest possible subtree of the view hierarchy that depends on the changed data.
                 */
                Text(model.date) // you might want to put it in a subview
//                DateView(model: model)
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

fileprivate struct TextEditSession: View {
    @Bindable var model: FruitObservation
    
    var body: some View {
        Section("description") {
            ForEach($model.fruits, id: \.name) { $fruit in
                TextField("description", text: $fruit.description)
            }
        }
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
