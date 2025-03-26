import Foundation

/*
 benefit: Updating views based on changes to the observable properties that a view’s body reads instead of any property changes that occur to an observable object, which can help improve your app’s performance.
 https://developer.apple.com/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro
 
 Basically, When you mark a class with @Observable, Swift automatically generates code to track changes to its properties, allowing SwiftUI to update views that depend on those properties.
 With the older ObservableObject approach, whenever any @Published property of an object changed, SwiftUI would re-render the entire view that depended on that object, even if the view didn’t actually use the changed property.
 */
@Observable
class FruitObservation {
    var title = "Title"
    var fruits = Fruit.examples
    var date = "June 6th"
    
    func addNewFruit() {
        fruits.append(Fruit.newFruit)
    }
    
    func update() {
        title += "*"
    }
}
