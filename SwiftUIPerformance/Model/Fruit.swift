import Foundation

struct Fruit: Hashable {
    var name: String
    var description: String
    
    static var examples: [Fruit] {
        [
            Fruit(name: "banana", description: "banana description"),
            Fruit(name: "apple", description: "apple description"),
            Fruit(name: "kiwi", description: "kiwi description")
        ]
    }
    
    static var newFruit: Fruit {
        Fruit(name: "newFruit", description: "newFruit description")
    }
}



//struct Fruit: Hashable, Identifiable {
//    let id = UUID()
//    var name: String
//    var description: String
//    
//    static var examples: [Fruit] {
//        [
//            Fruit(name: "banana", description: "banana description"),
//            Fruit(name: "apple", description: "apple description"),
//            Fruit(name: "kiwi", description: "kiwi description")
//        ]
//    }
//    
//    static var newFruit: Fruit {
//        Fruit(name: "newFruit", description: "newFruit description")
//    }
//}
