import Foundation

class FruitViewModel: ObservableObject {
    @Published var title: String = "Title"
    @Published var fruits: [Fruit] = Fruit.examples
    @Published var date: String = "June 6th"
    
    func addNewFruit() {
        fruits.append(Fruit.newFruit)
    }
    
    func update() {
        title += "*"
    }
}
