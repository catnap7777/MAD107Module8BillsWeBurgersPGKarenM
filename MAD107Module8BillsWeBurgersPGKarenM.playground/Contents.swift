import Cocoa

var str = "Hello, playground"

//.. This playground program uses hard coded menu item values from a dictionary, enums, functions, and structures... and calculates
//..   the order cost, the tax, the tip, and the total cost to the user

print("\n****************************************************************************************************************************************************")
print("********                                                    Bill's Amazing WeBurgers                                                        ********")
print("****************************************************************************************************************************************************")

//.. Approved Menu Items
var menuDictionary = ["French Fries": (price: 2.25, desc: "Super Deluxe French Fries"),
                      "Onion Rings": (price: 2.50, desc: "Onion Rings"),
                      "Cheese Stix":(price: 1.25, desc: "Cheese Stix"),
                      "Soda C":(price: 1.25, desc: "Coke"),
                      "Soda RB":(price:1.25, desc: "Root Beer"),
                      "Soda S":(price:1.25, desc: "Sprite"),
                      "Chicken Sandwich":(price:3.75, desc: "Chicken Sandwich with Mayo, Lettuce, Tomato, and Chipotle Sauce"),
                      "Gyro Meal Deal":(price:5.25, desc: "Gyro with French Fries and Homemade Coleslaw"),
                      //"Burger - Bacon": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Apple Roasted Bacon, Cheddar Cheese, and Mushrooms"),
                      "Burger - Bacon": (price: 4.75, desc: nil),
                      "Burger - Mushroom Swiss": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Swiss Cheese and Savory Mushrooms"),
                      "Burger - Veggie": (price: 4.75, desc: "1/4 lb Premium Veggie Burger with Spicy Mayo, Lettuce, and Tomato"),
                      "Burger - American": (price: 4.75, desc: "1/4 lb Angus Beef Burger with American Cheese, Lettuce, Tomato, Pickles, and our \"Special Sauce\""),
                      "Burger - BBQ": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Smokey BBQ Sauce, Lettuce, and Tomato"),
                      "Burger - Blue Cheese": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Blue Cheese and Ranch, Lettuce, and Tomato"),
                      "Burger - Japaleno": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Japalenos, PepperJack Cheese, Lettuce, Tomato, and our Spicy \"Salsa\" Sauce"),
                      "Burger - Pizza": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Mozarella Cheese, Lettuce, and our Fantastic Pizza Sauce"),
                      "Burger - Everything": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Apple Roasted Bacon, Cheddar Cheese, Lettuce, Tomato, Pickles, and Whatever Else You Want!")
]

let taxRateE = 0.075

var tipCalculatedE: Double = 0
var taxCalculatedE: Double = 0
var orderAmtE: Double = 0
var totalOrderAmtE: Double = 0

//..enum for food items other than burgers
enum FoodOrder {
    case burger(burger: String)
    case frenchFries(desc: String, price: Double)
    case softDrink(desc: String, price: Double)
    case chickenSandwich(desc: String, price: Double)
    case gyro(desc: String, price: Double)
    case onionRings(desc: String, price: Double)
    case cheeseStix(desc: String, price: Double)
}
//..enum for burgers
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
//................................................................................................................................................
//.. structure for ordering food/drinks
struct itemsOrdered {
    
    var itemOrder: FoodOrder
    
    var testMsg2: String {
        //printOrder()
        return "Thank you for ordering! \(itemOrder)"
    }
    
    func printOrder() {
        //.. switch to see what kind of food was ordered (burger or other items); instantiate myBurger if it was a burger OR set up enum object by referencing main menuDictionary to print out other food items
        switch itemOrder {
        case .burger(let burger):
            var myBurger = burgersOrdered(burgerKey: burger).printBurger()
            
        case .frenchFries(let desc, let prc), .chickenSandwich(let desc, let prc), .softDrink(let desc, let prc),
             .gyro(let desc, let prc), .onionRings(let desc, let prc), .cheeseStix(let desc, let prc):

            print("\nItem -->: \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
            
            //$\(String(format: "%.2f", itemPrice))")
        }
    }
}
//................................................................................................................................................
//.. structure for ordering burgers
struct burgersOrdered {
   
    var burgerKey: String
    
    func printBurger() {
        
        //.. initialization of burgerDesc
        var burgerDesc = BurgerType.baconBurger(type: "Initialized", desc: "* No Desc -> new burger? *", price: 0)
        
        //.. switch to see what kind of burger was ordered and then set up enum object by referencing main menuDictionary
        switch burgerKey {
        case "Burger - Bacon":
            burgerDesc = BurgerType.baconBurger(type: "Burger/Bacon", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Mushroom Swiss":
            burgerDesc = BurgerType.mushroomSwissBurger(type: "Burger/MushSW", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Veggie":
            burgerDesc = BurgerType.veggieBurger(type: "Burger/Veggie", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - American":
            burgerDesc = BurgerType.americanBurger(type: "Burger/American", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - BBQ":
            burgerDesc = BurgerType.bbqBurger(type: "Burger/BBQ", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Blue Cheese":
            burgerDesc = BurgerType.blueCheeseBurger(type: "Burger/BlueCh", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Japaleno":
            burgerDesc = BurgerType.jalapenoBurger(type: "Burger/Japaleno", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Pizza":
            burgerDesc = BurgerType.pizzaBurger(type: "Burger/Pizza", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Everything":
            burgerDesc = BurgerType.everythingBurger(type: "Burger/Everything", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        default:
            print("\n*** Error: Burger Not on Menu ***")
        }

        //.. switch to see which enum burger is ordered and used to print line item infomation
        switch burgerDesc {

        case .baconBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            print("\t\t\t *** Oh baby! If you love bacon, you're going to love this! ***")
            orderAmtE += prc
        case .mushroomSwissBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
        case .veggieBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
        case .americanBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
        case .bbqBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
        case .blueCheeseBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
        case .jalapenoBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            print("\t\t\t *** HOT!!! HOT!!! HOT!!! ***")
            orderAmtE += prc
        case .pizzaBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
            print("\t\t\t *** Who needs pizza when you can have this!!! ***")
        case .everythingBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $2.75")  //$\(String(format: "%.2f", prc))
            //orderAmtE += prc
            orderAmtE += 2.75
            print("\t\t\t *** On special today for $2.75 each ***")
        default:
            print("\nNo Burgers Ordered")
        }
    }
}
//................................................................................................................................................
//.. main function called when placing an order
func placeMyOrder (item: String) {
    
    let myItem = item
    let myMenu = menuDictionary
    //var itemFound = myMenu.keys.contains(item)
    
    //.. determine if the item (string) ordered is even in the menuDictionary
    if myMenu.keys.contains(myItem) {
    
        switch myItem {
        case "French Fries":
            let myFF = itemsOrdered(itemOrder: FoodOrder.frenchFries(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
            myFF.printOrder()
        case "Onion Rings":
            let myOR = itemsOrdered(itemOrder: FoodOrder.onionRings(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
            myOR.printOrder()
        case "Cheese Stix":
            let myCSX = itemsOrdered(itemOrder: FoodOrder.cheeseStix(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
           myCSX.printOrder()
        case "Soda C", "Soda RB", "Soda S":
            let mySoda = itemsOrdered(itemOrder: FoodOrder.softDrink(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
            mySoda.printOrder()
        case "Chicken Sandwich":
            let myCS = itemsOrdered(itemOrder: FoodOrder.chickenSandwich(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
            myCS.printOrder()
        case "Gyro Meal Deal":
            let myGY = itemsOrdered(itemOrder: FoodOrder.gyro(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
            myGY.printOrder()
        case "Burger - Bacon", "Burger - Mushroom Swiss", "Burger - Veggie", "Burger - American",
             "Burger - BBQ", "Burger - Blue Cheese", "Burger - Japaleno", "Burger - Pizza", "Burger - Everything":
            let myBur = itemsOrdered(itemOrder: FoodOrder.burger(burger: myItem))
            myBur.printOrder()
        default:
            print("*** Item not found on current menu. Please try again.")
        }
        
    } else {
        print("\n*Error->: \(myItem) -> Item requested not found on current menu *")
    }
    
}
//................................................................................................................................................
//.. calculate all order totals and print
func calcTotals() {
    
    taxCalculatedE = orderAmtE * taxRateE
    tipCalculatedE = orderAmtE * 0.20
    
    totalOrderAmtE = orderAmtE + taxCalculatedE + tipCalculatedE
    
    print("\n****************************************************************************************************************************************************")
    print("********                                                               TOTALS                                                               ********")
    print("****************************************************************************************************************************************************")

    print(".............................................................................................................")
    //print("\nSubtotal order amount without tax and tip = \t$\(orderAmt)")
    //.. formatted better
    print("\nSubtotal order amount without tax and tip = \t$\(String(format: "%.2f", orderAmtE))")

    print(".............................................................................................................")
    //print("Tax calculated at rate of \(taxRate) = \t\t\t\t$\(taxCalculated)")
    //.. formatted better
    print("Tax calculated at rate of \(taxRateE) = \t\t\t\t$\(String(format: "%.2f", taxCalculatedE))")

    print(".............................................................................................................")
    //print("Tip calculated at 20% = \t\t\t\t\t\t$\(tipCalculated)")
    //print("Tip calculated at 20% = \t\t\t\t\t\t$\(tipCalculated2)")
    //.. formatted better
    print("Tip calculated at 20% = \t\t\t\t\t\t$\(String(format: "%.2f", tipCalculatedE))")

    print(".............................................................................................................")
    print("The total amount for this order with tax and tip included: ")
    //print("\t\t--> $\(totalOrderAmt)")
    //.. formatted better
    print("\t\t\t    *****************")
    print("\t\t\t--> ***   $\(String(format: "%.2f", totalOrderAmtE))")
    print("\t\t\t    *****************")

}

//................................................................................................................................................
//.. place the orders for each item desired; at end, calculate receipt totals
placeMyOrder(item: "French Fries")
placeMyOrder(item: "Onion Rings")
placeMyOrder(item: "Soda C")
placeMyOrder(item: "Soda RB")
placeMyOrder(item: "7up")
placeMyOrder(item: "Chicken Sandwich")
placeMyOrder(item: "Burger - Pizza")
placeMyOrder(item: "Burger - Bacon")
placeMyOrder(item: "Burger - Japaleno")
placeMyOrder(item: "Cheese Stix")
placeMyOrder(item: "Burger - Mushroom Swiss")
placeMyOrder(item: "Burger - Everything")
placeMyOrder(item: "Burger - Bean")
calcTotals()

