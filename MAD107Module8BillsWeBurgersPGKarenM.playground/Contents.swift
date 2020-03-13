import Cocoa

var str = "Hello, playground"

//.. This playground program uses hard coded menu item values from an enum and an array and calculates
//..   the order cost, the tax, the tip, and the total cost to the user

//.. variables and initializations

//.. playing around with enums
print("*************************************************************************************************************")
print("********                            Code using Enums and Functions                                   ********")
print("*************************************************************************************************************")



//.. Menu items

var menuDictionary = ["French Fries": (price: 12.25, desc: "Super Deluxe French Fries"),
                      "Onion Rings": (price: 2.50, desc: "Onion Rings"),
                      "Cheese Stix":(price: 1.25, desc: "Cheese Stix"),
                      "Soda C":(price: 1.00, desc: "Coke"),
                      "Soda RB":(price:1.00, desc: "Root Beer"),
                      "Soda S":(price:1.00, desc: "Sprite"),
                      "Chicken Sandwich":(price:3.25, desc: "Chicken Sandwich with Mayo, Lettuce, Tomato, and Chipotle Sauce"),
                      "Gyro Meal Deal":(price:5.25, desc: "Gyro with French Fries and Homemade Coleslaw"),
                      "Burger - Bacon": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Apple Roasted Bacon, Cheddar, and Mushrooms"),
                      "Burger - Mushroom Swiss": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Apple Roasted Bacon, Cheddar, and Mushrooms"),
                      "Burger - Veggie": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Apple Roasted Bacon, Cheddar, and Mushrooms"),
                      "Burger - American": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Apple Roasted Bacon, Cheddar, and Mushrooms"),
                      "Burger - BBQ": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Apple Roasted Bacon, Cheddar, and Mushrooms"),
                      "Burger - Blue Cheese": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Apple Roasted Bacon, Cheddar, and Mushrooms"),
                      "Burger - Japaleno": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Apple Roasted Bacon, Cheddar, and Mushrooms"),
                      "Burger - Pizza": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Apple Roasted Bacon, Cheddar, and Mushrooms"),
                      "Burger - Everyting": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Apple Roasted Bacon, Cheddar, and Mushrooms")
]

enum FoodOrder {
    case burger(burger: String)
    case frenchFries(ffDesc: String, ffPrc: Double)
    case softDrink(sdDesc: String, sdPrc: Double)
    case chickenSandwich(csDesc: String, csPrc: Double)
    case gyro(gDesc: String, gPrc: Double)
    case onionRings(orDesc: String, orPrc: Double)
    case cheeseStix(csxDesc: String, csxPrc: Double)
}


//var kamffdesc = menuDictionary["French Fries"]
//print(kamffdesc)
//
//var kam77 = FoodOrder.frenchfries(ffDesc: kamffdesc?.desc ?? "I want to cry", ffPrc: kamffdesc?.price ?? 0)
//
//var kamff = FoodOrder.frenchfries(ffDesc: kamffdesc?.desc ?? "Mega Awesome French Fries", ffPrc: kamffdesc?.price ?? 0)
//print("this is the most insane thing ever: \(kamffdesc?.desc ?? "wtf")")
//print("this is the most insane thing ever2: \(kam77)")
////print("this is the most insane thing ever3: \(ffdesc)")
//
//switch kamff {
//
//case .burger(_):
//    print("hi1")
//case .frenchfries(let ffdesc, let ffprc):
//    print("hi1")
//    print("Does this thing actually work??? so convoluted... ffdesc: \(ffdesc) ffprc: \(ffprc)")
//case .softdrink(_, _):
//    print("hi1")
//case .chickensandwich(_, _):
//    print("hi1")
//case .gyro(_, _):
//    print("hi1")
//case .onionrings(_, _):
//    print("hi1")
//case .cheesestix(_, _):
//    print("hi1")
//}

enum BurgerType {
    case baconBurger(type: String , desc: String, price: Double )
    case mushroomSwissBurger(type: String , desc: String, price: Double )
    case veggieBurger(type: String , desc: String, price: Double )
    case americanBurger(type: String , desc: String, price: Double )
    case bbqBurger(type: String , desc: String, price: Double )
    case blueCheeseBurger(type: String , desc: String, price: Double )
    case jalapenoBurger(type: String , desc: String, price: Double )
    case pizzaBurger(type: String , desc: String, price: Double )
    case everythingBurger(type: String , desc: String, price: Double )
}

struct itemsOrdered2 {
    
    var itemOrder: FoodOrder
    
    var testMsg2: String {
        //printOrder()
        return "Thank you for ordering! \(itemOrder)"
    }
    
    func printOrder() {

        switch itemOrder {
        case .burger(let burger):
            print("nice burger = \(burger)")
            
            var myBurger = burgersOrdered(burgerKey: burger).printBurger()
            //printBurger()
            
            
            //var myCSX = itemsOrdered2(itemOrder: FoodOrder.cheeseStix(csxDesc: menuDictionary[myItem]?.desc ?? " ", csxPrc: menuDictionary[myItem]?.price ?? 0))
//            var myBurger = burgersOrdered(burgerOrder: "Burger", burgerType: "Burger", burgerDesc: burger, burgerPrice: menuDictionary[burger]?.price ?? 0)
            
        case .frenchFries(let desc, let prc), .chickenSandwich(let desc, let prc), .softDrink(let desc, let prc),
             .gyro(let desc, let prc), .onionRings(let desc, let prc), .cheeseStix(let desc, let prc):

            //print("nice french fries")
            //print("Item: \(ffDesc) Price: \(ffPrc)")
            print("Item -->: \(desc) Price: \(prc)")
        }
    }
}

struct burgersOrdered {
   
    var burgerKey: String
    
    func printBurger() {
        
        var burgerDesc = BurgerType.baconBurger(type: "Initialized", desc: "* No Desc -> new burger? *", price: 0)
        
        switch burgerKey {
        case "Burger - Bacon":
            burgerDesc = BurgerType.baconBurger(type: "Burger/Bacon", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Mushroom Swiss":
            burgerDesc = BurgerType.mushroomSwissBurger(type: "Burger/MushSW", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Veggie":
            burgerDesc = BurgerType.veggieBurger(type: "Burger/Veggie", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - American":
            burgerDesc = BurgerType.americanBurger(type: "Burger/Amer", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - BBQ":
            burgerDesc = BurgerType.bbqBurger(type: "Burger/BBQ", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Blue Cheese":
            burgerDesc = BurgerType.blueCheeseBurger(type: "Burger/BlueCh", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Japaleno":
            burgerDesc = BurgerType.jalapenoBurger(type: "Burger/Japa", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Pizza":
            burgerDesc = BurgerType.pizzaBurger(type: "Burger/Pizza", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Everyting":
            burgerDesc = BurgerType.everythingBurger(type: "Burger/Every", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        default:
            print("*** Error: Burger Not on Menu ***")
        }

        switch burgerDesc {

        case .baconBurger(let type, let desc, let price):
            print("\(type): \(desc) Price: \(price)")
            print("\t *** Oh baby! If you love bacon, you're going to love this! ***")
        case .mushroomSwissBurger(let type, let desc, let price):
            print("\(type): \(desc) Price: \(price)")
        case .veggieBurger(let type, let desc, let price):
            print("\(type): \(desc) Price: \(price)")
        case .americanBurger(let type, let desc, let price):
            print("\(type): \(desc) Price: \(price)")
        case .bbqBurger(let type, let desc, let price):
            print("\(type): \(desc) Price: \(price)")
        case .blueCheeseBurger(let type, let desc, let price):
            print("\(type): \(desc) Price: \(price)")
        case .jalapenoBurger(let type, let desc, let price):
            print("\(type): \(desc) Price: \(price)")
        case .pizzaBurger(let type, let desc, let price):
            print("\(type): \(desc) Price: \(price)")
        case .everythingBurger(let type, let desc, let price):
            print("\(type): \(desc) Price: \(price)")
        default:
            print("No Burgers Ordered")
        }
    }
}

func placeMyOrder (item: String) {
    
    //var itemArray: [String] = ["french fries", "soda", "cheesestix", "burger", "chicken sandwich", "gyro", "onion rings"]
    
    var myItem = item
    var myMenu = menuDictionary
    var itemFound = myMenu.keys.contains(item)
    
    //print("@@@@@@ is this really gonna work?111 idk.... \(itemFound)")
    
//    let index = str.index(str.startIndex, offsetBy: 6)
//    let mySubstring = str[..<index] // Hello
    
//    let index = item.index(item.startIndex, offsetBy: 6)
//    let mySubstring = item[..<index] // Hello
//    var myItem = String(mySubstring)
//    print(myItem)
    
    if myMenu.keys.contains(myItem) {
        print("@@@@@@ is this really gonna work?222 idk.... \(itemFound)")
        print(myItem)
        switch myItem {
        case "French Fries":
            //print("French Fries")
            //var myFF = itemsOrdered2(itemOrdered: FoodOrder.frenchfries(ffDesc: "wfh", ffPrc: 99))
            var myFF = itemsOrdered2(itemOrder: FoodOrder.frenchFries(ffDesc: menuDictionary[myItem]?.desc ?? " ", ffPrc: menuDictionary[myItem]?.price ?? 0))
            //print(myFF.testMsg2)
            print(myFF.printOrder())
        case "Onion Rings":
            //print("Onion Rings")
            var myOR = itemsOrdered2(itemOrder: FoodOrder.onionRings(orDesc: menuDictionary[myItem]?.desc ?? " ", orPrc: menuDictionary[myItem]?.price ?? 0))
            print(myOR.printOrder())
        case "Cheese Stix":
            var myCSX = itemsOrdered2(itemOrder: FoodOrder.cheeseStix(csxDesc: menuDictionary[myItem]?.desc ?? " ", csxPrc: menuDictionary[myItem]?.price ?? 0))
            print(myCSX.printOrder())
        case "Soda C", "Soda RB", "Soda S":
            var mySoda = itemsOrdered2(itemOrder: FoodOrder.softDrink(sdDesc: menuDictionary[myItem]?.desc ?? " ", sdPrc: menuDictionary[myItem]?.price ?? 0))
            print(mySoda.printOrder())
//        case "Soda RB":
//            var myOR = itemsOrdered2(itemOrdered: FoodOrder.softdrink(orDesc: myItem, orPrc: menuDictionary[myItem]?.price ?? 0))
//            print(myOR.printOrder())
//        case "Soda S":
//            var myOR = itemsOrdered2(itemOrdered: FoodOrder.softdring(orDesc: myItem, orPrc: menuDictionary[myItem]?.price ?? 0))
//            print(myOR.printOrder())
        case "Chicken Sandwich":
            var myCS = itemsOrdered2(itemOrder: FoodOrder.chickenSandwich(csDesc: menuDictionary[myItem]?.desc ?? " ", csPrc: menuDictionary[myItem]?.price ?? 0))
            print(myCS.printOrder())
        case "Gyro Meal Deal":
            var myGY = itemsOrdered2(itemOrder: FoodOrder.gyro(gDesc: menuDictionary[myItem]?.desc ?? " ", gPrc: menuDictionary[myItem]?.price ?? 0))
            print(myGY.printOrder())
        case "Burger - Bacon", "Burger - Mushroom Swiss", "Burger - Veggie", "Burger - American",
             "Burger - BBQ", "Burger - Blue Cheese", "Burger - Japaleno", "Burger - Pizza", "Burger - Everything":
            var myBur = itemsOrdered2(itemOrder: FoodOrder.burger(burger: myItem))
            print(myBur.printOrder())
        default:
            print("*** Item not found on current menu. Please try again.")
            
        }
        
    } else {
        print("Sorry... input item requested not found on current menu: \(myItem)")
    }
    
}

//placeMyOrder(item: "French Fries")
//placeMyOrder(item: "Onion Rings")
//placeMyOrder(item: "Soda C")
//placeMyOrder(item: "Chicken Sandwich")
placeMyOrder(item: "Burger - Pizza")
placeMyOrder(item: "Burger - Bacon")
