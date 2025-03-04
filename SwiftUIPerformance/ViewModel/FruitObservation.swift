import Foundation

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
