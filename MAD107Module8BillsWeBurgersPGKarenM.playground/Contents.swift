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
    
    //var burgerOrder: BurgerType
    
//    var burgerType: String
    var burgerKey: String
    
    
//    var burgerPrice: Double
    
//    var testMsg: String {
//        return "Excellent choice btw ordering a \(burgerType): \(burgerDesc)"
//    }
    
//    func getBurger(key: String) {
//
//        var burgerDesc = BurgerType.baconBurger(type: "who knows if this will work", desc: "i'm going to cry", price: 0)
//        printBurger()
//    }
    
    func printBurger() {
        
//        if burgerKey == "Burger - Bacon" {
//            var burgerDesc = BurgerType.baconBurger(type: "Burger TEST", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
//        }
//
//        var burgerDesc2 = burgerDesc
        
        var burgerDesc = BurgerType.baconBurger(type: "Burger", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        
        switch burgerDesc {
            
//        case .burger(let burger):
//            print("nice burger = \(burger)")
//            var myBurger = burgerOrder(burgerType: "Burger", burgerDesc: burger, burgerPrice: menuDictionary[burger]?.price ?? 0)
//
//        case .frenchFries(let desc, let prc), .chickenSandwich(let desc, let prc), .softDrink(let desc, let prc),
//             .gyro(let desc, let prc), .onionRings(let desc, let prc), .cheeseStix(let desc, let prc):
//
//            //print("nice french fries")
//            //print("Item: \(ffDesc) Price: \(ffPrc)")
//            print("Item -->: \(desc) Price: \(prc)")
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

    
//    func printOrder() {
//
//        switch itemOrdered {
//
//        case .burger(let burger):
//            print("nice burger")
//        case .frenchfries(let ffDesc, let ffPrc):
//            print("nice french fries")
//            print("Item: \(ffDesc) Price: \(ffPrc)")
//        case .softdrink(let sdDesc, let sdPrc):
//            print("nice softdrink")
//            print("Item: \(sdDesc) Price: \(sdPrc)")
//        case .chickensandwich(let csDesc, let csPrc):
//            print("nice chicken sandwich")
//        case .gyro(let gDesc, let gPrc):
//            print("nice gyro")
//        case .onionrings(let orDesc, let orPrc):
//            print("nice onion rings")
//            print("Item: \(orDesc) Price: \(orPrc)")
//        case .cheesestix(let csxDesc, let csxPrc):
//            print("nice cheese stix")
//        }
//    }
    
    
    



func placeMyOrder (item: String) {
    
    //var itemArray: [String] = ["french fries", "soda", "cheesestix", "burger", "chicken sandwich", "gyro", "onion rings"]
    
    var myItem = item
    var myMenu = menuDictionary
    var itemFound = myMenu.keys.contains(myItem)
    
    //print("@@@@@@ is this really gonna work?111 idk.... \(itemFound)")
    
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
        case "Burger - Bacon":
            var myBur = itemsOrdered2(itemOrder: FoodOrder.burger(burger: myItem))
            print(myBur.printOrder())
        default:
            print("goodbye")
            
        }
        
    } else {
        print("Sorry... input item requested not found on current menu: \(myItem)")
    }
    
}

//placeMyOrder(item: "French Fries")
//placeMyOrder(item: "Onion Rings")
//placeMyOrder(item: "Soda C")
//placeMyOrder(item: "Chicken Sandwich")
placeMyOrder(item: "Burger - Bacon")

//struct burgerOrdered {
//
//    var burgerType: String
//    var burgerDesc: String
//    var burgerPrice: Double
//
//    var testMsg: String {
//        return "Excellent choice btw ordering a \(burgerType): \(burgerDesc)"
//
//    }
//}

//struct itemsOrdered {
//
//    var itemOrdered: FoodOrder
//
//    var testMsg2: String {
//        printOrder()
//        return "Thank you for ordering! \(itemOrdered)"
//    }
//
//    func printOrder() {
//
//        switch itemOrdered {
//
//        case .burger(_):
//            print("nice burger")
//        case .frenchFries(let ffdesc, let ffprc):
//            print("nice french fries")
//        case .softDrink(_, _):
//            print("nice soft drink")
//        case .chickenSandwich(_, _):
//            print("nice chickensandwich")
//        case .gyro(let gdesc, let gprc):
//            print("nice gyro")
//            print("Thank you for ordering: \(gdesc) at \(gprc)")
//        case .onionRings(_, _):
//            print("nice onion rings")
//        case .cheeseStix(let csdesc, let csprc):
//            print("nice cheesestix")
//        }
//    }
//
//
//}
//




////********************
//var kamMyItems = itemsOrdered(itemOrdered: FoodOrder.gyro(gDesc: menuDictionary["Gyro Meal Deal"]?.desc ?? " ", gPrc: menuDictionary["Gyro Meal Deal"]?.price ?? 0))
//print(kamMyItems.testMsg2)
////********************
//
//var cs = menuDictionary["Cheese Stix"]
//var kamcsdesc = cs?.desc
//var kamcsprc = cs?.price
//var item = itemsOrdered(itemOrdered: FoodOrder.cheesestix(csDesc: kamcsdesc ?? " ", csPrc: kamcsprc ?? 0))
//print("\n**** item: \(item)")
//
//print("\n\n\(menuDictionary)")
//var kamTestOrder1 = menuDictionary["French Fries"]
//print(kamTestOrder1)
//
//var ffdesc = kamTestOrder1?.desc
//print(ffdesc)
//var ffprc = kamTestOrder1?.price
//print(ffprc)
//
//
//



//var cheeseBurger = FoodOrder.burger("Cheese Burger", "Double Bacon Burger Special with Cheese", 3.00)
//var burger = FoodOrder.burger("it's true")
//var frenchFries = FoodOrder.frenchfries("French Fries", 2.25)
//var softDrink = FoodOrder.softdrink("Soft Drink", "Coca Cola", 1.00)
//var chickenSandwich = FoodOrder.chickensandwich("Chicken Sandwich", 3.25)
//var gyro = FoodOrder.gyro("Gyro Sandwich", 4.25)
//var onionRings = FoodOrder.onionrings("Onion Rings", 2.25)
//var cheeseStix = FoodOrder.cheesestix("Cheese Stix", 1.25)

//var orderLineItem = cheeseBurger
//var orderLineItem = burger
//
//let taxRateE = 0.075
//
//var itemOrderedE: String = ""
//var itemPriceE: Double = 0.00
//var tipCalculatedE: Double = 0
//var tipCalculated2E: Double = 0
//var taxCalculatedE: Double = 0
//var orderAmtE: Double = 0
//var totalOrderAmtE: Double = 0
//

//func orderedLineItem(
//
//.. I don't understand how to pass enum data into a function and then call it :(
//func printMenuItemOrdered(orderLineItem: FoodOrder) {
//print(orderLineItem)
//printMenuItemOrdered(orderLineItem: FoodOrder)

//func printMenuItemOrdered() {
//
//    switch orderLineItem {
//    case .cheeseburger(var burgerType, var burgerDesc, var burgerPrice):
//        print("\t\t\(burgerType) - \(burgerDesc) = $\(String(format: "%.2f", burgerPrice))")
//        orderAmtE += burgerPrice
//    case .frenchfries(var item, var itemPrice):
//        print("\t\t\(item) = $\(String(format: "%.2f", itemPrice))")
//        orderAmtE += itemPrice
//    case .softdrink(var itemType, var itemDesc, var itemPrice):
//        print("\t\t\(itemType) - \(itemDesc) = $\(String(format: "%.2f", itemPrice))")
//        orderAmtE += itemPrice
//    case .chickensandwich(var item, var itemPrice):
//        print("\t\t\(item) = $\(String(format: "%.2f", itemPrice))")
//        orderAmtE += itemPrice
//    case .gyro(var item, var itemPrice):
//        print("\t\t\(item) = $\(String(format: "%.2f", itemPrice))")
//        orderAmtE += itemPrice
//    case .onionrings(var item, var itemPrice):
//        print("\t\t\(item) = $\(String(format: "%.2f", itemPrice))")
//        orderAmtE += itemPrice
//    case .cheesestix(var item, var itemPrice):
//        print("\t\t\(item) = $\(String(format: "%.2f", itemPrice))")
//        orderAmtE += itemPrice
//    }
//}
//
//print(".............................................................................................................")
//print("Items ordered off the menu today include:\n")
//


//orderLineItem = cheeseBurger
//printMenuItemOrdered()
//orderLineItem = frenchFries
//printMenuItemOrdered()
//orderLineItem = softDrink
//printMenuItemOrdered()
//orderLineItem = chickenSandwich
//printMenuItemOrdered()
//orderLineItem = gyro
//printMenuItemOrdered()
//orderLineItem = onionRings
//printMenuItemOrdered()
//orderLineItem = cheeseStix
//printMenuItemOrdered()
//orderLineItem = FoodOrder.softdrink("*** FREE SOFT DRINK WITH PURCHASE ***", "Dr. Pepper", 0.0)
//printMenuItemOrdered()

//taxCalculatedE = orderAmtE * taxRateE
//tipCalculatedE = orderAmtE * 0.20
////..if calculating as a number and not converting to string
////tipCalculated2 = round(orderAmt * 0.20 * 100)/100
//
//totalOrderAmtE = orderAmtE + taxCalculatedE + tipCalculatedE
//
//print(".............................................................................................................")
////print("\nSubtotal order amount without tax and tip = \t$\(orderAmt)")
////.. formatted better
//print("\nSubtotal order amount without tax and tip = \t$\(String(format: "%.2f", orderAmtE))")
//
//print(".............................................................................................................")
////print("Tax calculated at rate of \(taxRate) = \t\t\t\t$\(taxCalculated)")
////.. formatted better
//print("Tax calculated at rate of \(taxRateE) = \t\t\t\t$\(String(format: "%.2f", taxCalculatedE))")
//
//print(".............................................................................................................")
////print("Tip calculated at 20% = \t\t\t\t\t\t$\(tipCalculated)")
////print("Tip calculated at 20% = \t\t\t\t\t\t$\(tipCalculated2)")
////.. formatted better
//print("Tip calculated at 20% = \t\t\t\t\t\t$\(String(format: "%.2f", tipCalculatedE))")
//
//print(".............................................................................................................")
//print("The total amount for this order with tax and tip included: ")
////print("\t\t--> $\(totalOrderAmt)")
////.. formatted better
//print("\t\t    *****************")
//print("\t\t--> ***   $\(String(format: "%.2f", totalOrderAmtE))")
//print("\t\t    *****************")
//

////.. Same thing but using a 2D Array instead
////
//print("\n\n*************************************************************************************************************")
//print("********                                     Code using Arrays                                       ********")
//print("*************************************************************************************************************")
//
////.. 2D Array
//let foodOrdered = [["Cheese Burger", 3.00],["French Fries", 2.25],["Soft Drink", 1.00],
//                   ["Chicken Sandwich", 3.25], ["Gyro", 4.25], ["Onion Rings", 2.25], ["Cheese Stix", 1.25]]
//
//let taxRate = 0.075
//
//var itemOrdered: String = ""
//var itemPrice: Double = 0.00
//var tipCalculated: Double = 0
//var tipCalculated2: Double = 0
//var taxCalculated: Double = 0
//var orderAmt: Double = 0
//var totalOrderAmt: Double = 0
//var i = 0
//
//print(".............................................................................................................")
//print("Items ordered off the menu today include:\n")
//
//for item in foodOrdered {
//    //print(item)
//    itemOrdered = foodOrdered[i][0] as! String
//    itemPrice = foodOrdered[i][1] as! Double
//    //print("\t\t\(itemOrdered) = $\(itemPrice)")
//    //.. formatted better
//    print("\t\t\(itemOrdered) = $\(String(format: "%.2f", itemPrice))")
//    i += 1
//    orderAmt += itemPrice
//}
//
//taxCalculated = orderAmt * taxRate
//tipCalculated = orderAmt * 0.20
////..if calculating as a number and not converting to string
////tipCalculated2 = round(orderAmt * 0.20 * 100)/100
//
//totalOrderAmt = orderAmt + taxCalculated + tipCalculated
//
//print(".............................................................................................................")
////print("\nSubtotal order amount without tax and tip = \t$\(orderAmt)")
////.. formatted better
//print("\nSubtotal order amount without tax and tip = \t$\(String(format: "%.2f", orderAmt))")
//
//print(".............................................................................................................")
////print("Tax calculated at rate of \(taxRate) = \t\t\t\t$\(taxCalculated)")
////.. formatted better
//print("Tax calculated at rate of \(taxRate) = \t\t\t\t$\(String(format: "%.2f", taxCalculated))")
//
//print(".............................................................................................................")
////print("Tip calculated at 20% = \t\t\t\t\t\t$\(tipCalculated)")
////print("Tip calculated at 20% = \t\t\t\t\t\t$\(tipCalculated2)")
////.. formatted better
//print("Tip calculated at 20% = \t\t\t\t\t\t$\(String(format: "%.2f", tipCalculated))")
//
//print(".............................................................................................................")
//print("The total amount for this order with tax and tip included: ")
////print("\t\t--> $\(totalOrderAmt)")
////.. formatted better
//print("\t\t    *****************")
//print("\t\t--> ***   $\(String(format: "%.2f", totalOrderAmt))")
//print("\t\t    *****************")
//
