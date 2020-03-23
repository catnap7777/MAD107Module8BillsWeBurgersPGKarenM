import Cocoa

var str = "Hello, playground"

//.. This playground program uses hard coded menu item values from a dictionary, enums, functions, and structures... and calculates
//..   the order cost, the tax, the tip, and the total cost to the user

//print("\n****************************************************************************************************************************************************")
//print("********                                                    Bill's Amazing WeBurgers                                                        ********")
//print("****************************************************************************************************************************************************")

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
    case Burger(burger: String)
    case FrenchFries(desc: String, price: Double)
    case SoftDrink(desc: String, price: Double)
    case ChickenSandwich(desc: String, price: Double)
    case Gyro(desc: String, price: Double)
    case OnionRings(desc: String, price: Double)
    case CheeseStix(desc: String, price: Double)
}
//..enum for burgers
enum BurgerType {
    case BaconBurger(type: String , desc: String, price: Double )
    case MushroomSwissBurger(type: String , desc: String, price: Double )
    case VeggieBurger(type: String , desc: String, price: Double )
    case AmericanBurger(type: String , desc: String, price: Double )
    case BbqBurger(type: String , desc: String, price: Double )
    case BlueCheeseBurger(type: String , desc: String, price: Double )
    case JalapenoBurger(type: String , desc: String, price: Double )
    case PizzaBurger(type: String , desc: String, price: Double )
    case EverythingBurger(type: String , desc: String, price: Double )
}
//................................................................................................................................................
//.. structure for ordering food/drinks
struct ItemsOrdered {
    
    var itemOrder: FoodOrder
    
    //..
    var testMsg2: String {
        //printOrder()
        //return "Thank you for ordering! \(itemOrder)"
        return "\n\nThank you for ordering! Bill\'s Amazing WeBurgers appreciates your business!"
    }
    
    func printOrder() {
        //.. switch to see what kind of food was ordered (burger or other items); instantiate myBurger if it was a burger OR set up enum object by referencing main menuDictionary to print out other food items
        switch itemOrder {
        case .Burger(let burger):
            var myBurger = BurgersOrdered(burgerKey: burger).printBurger()
            
        case .FrenchFries(let desc, let prc), .ChickenSandwich(let desc, let prc), .SoftDrink(let desc, let prc),
             .Gyro(let desc, let prc), .OnionRings(let desc, let prc), .CheeseStix(let desc, let prc):
            
            print("\nItem -->: \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
            
            //$\(String(format: "%.2f", itemPrice))")
        }
    }
}
//................................................................................................................................................
//.. structure for ordering burgers
struct BurgersOrdered {
    
    var burgerKey: String
    
    func printBurger() {
        
        //.. initialization of burgerDesc
        var burgerDesc = BurgerType.BaconBurger(type: "Initialized", desc: "* No Desc -> new burger? *", price: 0)
        
        //.. switch to see what kind of burger was ordered and then set up enum object by referencing main menuDictionary
        switch burgerKey {
        case "Burger - Bacon":
            burgerDesc = BurgerType.BaconBurger(type: "Burger/Bacon", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Mushroom Swiss":
            burgerDesc = BurgerType.MushroomSwissBurger(type: "Burger/MushSW", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Veggie":
            burgerDesc = BurgerType.VeggieBurger(type: "Burger/Veggie", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - American":
            burgerDesc = BurgerType.AmericanBurger(type: "Burger/American", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - BBQ":
            burgerDesc = BurgerType.BbqBurger(type: "Burger/BBQ", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Blue Cheese":
            burgerDesc = BurgerType.BlueCheeseBurger(type: "Burger/BlueCh", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Japaleno":
            burgerDesc = BurgerType.JalapenoBurger(type: "Burger/Japaleno", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Pizza":
            burgerDesc = BurgerType.PizzaBurger(type: "Burger/Pizza", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Everything":
            burgerDesc = BurgerType.EverythingBurger(type: "Burger/Everything", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        default:
            print("\n*** Error: Burger Not on Menu ***")
        }
        
        //.. switch to see which enum burger is ordered and used to print line item infomation
        switch burgerDesc {
            
        case .BaconBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            print("\t\t\t *** Oh baby! If you love bacon, you're going to love this! ***")
            orderAmtE += prc
        case .MushroomSwissBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
        case .VeggieBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
        case .AmericanBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
        case .BbqBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
        case .BlueCheeseBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
        case .JalapenoBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            print("\t\t\t *** HOT!!! HOT!!! HOT!!! ***")
            orderAmtE += prc
        case .PizzaBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
            print("\t\t\t *** Who needs pizza when you can have this!!! ***")
        case .EverythingBurger(let type, let desc, let prc):
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
            let myFF = ItemsOrdered(itemOrder: FoodOrder.FrenchFries(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
            myFF.printOrder()
        case "Onion Rings":
            let myOR = ItemsOrdered(itemOrder: FoodOrder.OnionRings(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
            myOR.printOrder()
        case "Cheese Stix":
            let myCSX = ItemsOrdered(itemOrder: FoodOrder.CheeseStix(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
            myCSX.printOrder()
        case "Soda C", "Soda RB", "Soda S":
            let mySoda = ItemsOrdered(itemOrder: FoodOrder.SoftDrink(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
            mySoda.printOrder()
        case "Chicken Sandwich":
            let myCS = ItemsOrdered(itemOrder: FoodOrder.ChickenSandwich(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
            myCS.printOrder()
        case "Gyro Meal Deal":
            let myGY = ItemsOrdered(itemOrder: FoodOrder.Gyro(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
            myGY.printOrder()
        case "Burger - Bacon", "Burger - Mushroom Swiss", "Burger - Veggie", "Burger - American",
             "Burger - BBQ", "Burger - Blue Cheese", "Burger - Japaleno", "Burger - Pizza", "Burger - Everything":
            let myBur = ItemsOrdered(itemOrder: FoodOrder.Burger(burger: myItem))
            myBur.printOrder()
        default:
            print("*** Item not found on current menu. Please try again.")
        }
        
    } else {
        print("\n*Error->: \(myItem) -> Item requested not found on current menu *")
    }
    
}


class KarenTestClass {
    
//    var nbr1: Int = 98
//    var nbr2: Int? = 99
//    var nbrAdded: Int
//
//    init(nbr1: Int, nbr2: Int?, nbrAdded: Int) {
//        self.nbr1 = nbr1
//        self.nbr2 = nbr2
//        self.nbrAdded = nbrAdded
//
//    }
    
    var text: String
    var nbr1a: Int = 99
    var nbr2a: Int = 98
    var nbr3a: Int = 97
    
    var nbr4: Int
    
    init(text: String, nbr4: Int) {
        self.text = text
        self.nbr4 = nbr4
    }
    
    struct testStruct {
        
        var nbr5 = 9999
        var nbr6 = 9998
        var myString = "this is crazy!!!!"
        
        var myString2: String
            {
            get{
                return "\n \(myString) nbr5 = \(nbr5) and nbr6 = \(nbr6)"
            }
        }
    }
    
//    init(nbr1a: Int, nbr2a: Int, nbr3a: Int) {
//        self.nbr1a = nbr1a
//        self.nbr2a = nbr2a
//        self.nbr3a = nbr3a
//    }
    
//    init() {
//        var nbr1a: Int = 98
//        var nbr2a: Int = 99
//        var nbr3a: Int = 0
//    }
    
    func useInitializer() {
        
        print("Using initializers: nbr1a = \(nbr1a)")
        print("Using initializers: nbr2a = \(nbr2a)")
        print("Using initializers: nbr3a = \(nbr3a)")
        
    }

    
    func sendAMsg(nbr1: Int, nbr2: Int?, nbrAdded: Int) -> String {
        
        var nbr3 = 0
        var nbrAdded2 = 0
        
        print("nbr1 initially ... \(nbr1)")
        //print("nbr2 initially ... \(nbr2 ?? 77)")
        print("nbr2 initially ... \(nbr2)")
        print("nbr3 initially ... \(nbr3)")
        print("nbrAdded initially ... \(nbrAdded)\n")
        
        if var nbr2test = nbr2 {
            nbr3 = nbr2test
            nbrAdded2 = nbrAdded
            print("nbr2 is NOT nil coming in... nbr3 = \(nbr3)")
            
        } else {
            nbr3 = 1000
            nbrAdded2 = nbr3 + nbr1
            print("nbr2 was initially nil, so set it to...nbr3 = \(nbr3)")
            
        }
        
        print("\nnbr3 right now: \(nbr3)")
        print("nbr2 right now: \(nbr2)")
        
        
        //        var msg1: String {
        //            return "You added two numbers together and got a result \(nbr1) + \(nbr2) = \(nbrAdded)"
        //        }
        //var msg1: String {
        return "You added two numbers together and got a result \(nbr1) + \(nbr3) = \(nbrAdded2)"
        //}
    }
}

class KarenTestSubclass: KarenTestClass {
    
    override func sendAMsg(nbr1: Int, nbr2: Int?, nbrAdded: Int) -> String {
        
        //        var msg1: String {
        //            let details = super.sendAMsg(nbr1: 5, nbr2: 7, nbrAdded: 12)
        //            return "Say what? \(details)"
        //        }
        
        //var msg1: String {
        //let details = super.sendAMsg(nbr1: 5, nbr2: 7, nbrAdded: 12)
        let details = super.sendAMsg(nbr1: nbr1, nbr2: nbr2, nbrAdded: 500000)  //<----- notice how third parm is overriden here too!
        return "Say what? \(details)"
        //}
    }
}

//.. worked on this class after looking and classes/subclasses LinkedIn learning video

class KarenTestClass2 {
    
    //.. instance properties
    var number1: Int
    var number2: Int
    var msg1: String = "This is how we do it..."
    var msg2: String
    
    //.. type properties (these are for any and all instances of the class created
    static var msg3 = "It\'s Friday night... "
    
    //.. optional properties
    var msg4: String?
    
    //.. computed properties
    var nbrsAdded: Int {
        return number1 + number2
    }
    
    var nbrsMult: Int {
        get {
            return number1 * number2
        }
        
        set {
            number1 = newValue
        }
    }
    
    //.. class initalization (main init)
    init(number1: Int, number2: Int, msg2: String) {
        self.number1 = number1
        self.number2 = number2
        self.msg2 = msg2
    }
    
    convenience init(number1: Int, number2: Int) {
        self.init(number1: number1, number2: number2, msg2: "what in the heck is going on")
    }
    
    func printTest1(msg4: String?) {
        
        if let msg4 = msg4 {
            print ("msg4 was NOT nil")
        } else {
            print("msg4 was nil")
        }
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
    
    let tempItemsOrdered = ItemsOrdered(itemOrder: FoodOrder.Burger(burger: ""))
    print(tempItemsOrdered.testMsg2)
    
    
    
}



struct testStruct2 {
    
    var nbr5: Int?  = 9999
    var nbr6: Int? = 9998
    var myString: String? = "this is crazy!!!!"
    
    var myString2: String
    {
        get{
            return "\n \(myString ?? "not working") nbr5 = \(nbr5 ?? 0) and nbr6 = \(nbr6 ?? 0)"
        }
    }
}


//................................................................................................................................................
//.. place the orders for each item desired; at end, calculate receipt totals
//placeMyOrder(item: "French Fries")
//placeMyOrder(item: "Onion Rings")
//placeMyOrder(item: "Soda C")
//placeMyOrder(item: "Soda RB")
//placeMyOrder(item: "7up")
//placeMyOrder(item: "Chicken Sandwich")
//placeMyOrder(item: "Burger - Pizza")
//placeMyOrder(item: "Burger - Bacon")
//placeMyOrder(item: "Burger - Japaleno")
//placeMyOrder(item: "Cheese Stix")
//placeMyOrder(item: "Burger - Mushroom Swiss")
//placeMyOrder(item: "Burger - Everything")
//placeMyOrder(item: "Burger - Bean")
//calcTotals()
//

//var x = KarenTestClass()
//print("\n\n")
//print(x.sendAMsg(nbr1: 5, nbr2: nil, nbrAdded: 10))
//

//var xyz = KarenTestClass()
var y = KarenTestSubclass(text: "\nThis is flippin' insane!\n", nbr4: 1000)
//var y = KarenTestSubclass()
//var y = KarenTestSubclass(nbr1: 7, nbr2: nil, nbrAdded: 11)
print("\n")
print(y.sendAMsg(nbr1: 7, nbr2: nil, nbrAdded: 11))


var a1 = KarenTestClass(text: "hi how are ya?", nbr4: 2000)
print("\n")
print(a1.useInitializer())
print("\(a1.text) and the nbr4 is \(a1.nbr4)")

var a2 = KarenTestClass(text: "trying something new...", nbr4: 3000)
// print("\n")
a2.useInitializer()
print("\n")

var a3 = KarenTestClass(text: "\ntrying to call the structure crazy...", nbr4: 4000)
a3.nbr1a = 45
a3.useInitializer()
var a4 = a3.text
print(a4)
//var kamTestStructure = a3.testStruct  //does not work

print("\n Test of Structure: ")
//var a5 = testStruct2(nbr5: nil, nbr6: nil, myString: nil)
var a5 = testStruct2()
print(a5.myString2)





//
//var y2 = KarenTestSubclass(nbr1: 7, nbr2: 4, nbrAdded: 11)
//print("\n\n")
//print(y2.sendAMsg(nbr1: 7, nbr2: nil, nbrAdded: 11))
//

//var z = KarenTestClass()
//print("\n\n")
//print(z.sendAMsg(nbr1: 7, nbr2: nil, nbrAdded: 14))

//var a = KarenTestClass2(number1: 12, number2: 12)
//print("\n")
//print(a.nbrsAdded)
//print(a.nbrsMult)
//print(a.msg1)
//print(a.msg2)
//print(a.msg4)

//var b = KarenTestClass2(number1: 5, number2: 4, msg2: "Oops! I did it again")
//print("\n")
//print(b.nbrsAdded)
//print(b.nbrsMult)
//print(b.msg1)
//print(b.msg2)
//print(b.msg4)
//print("number1 = \(b.number1)  number2 = \(b.number2)")
//b.number1 = 7
//print("\tnumber1 now set to = \(b.number1)")
//print("\t\(b.number1) + \(b.number2) = \(b.nbrsAdded)")
//print("\t\(b.number1) * \(b.number2) = \(b.nbrsMult)")
//
//var c = KarenTestClass2(number1: 2, number2: 1)
//print("\n")
//c.printTest1(msg4: nil)
//c.printTest1(msg4: "now the input string is NOT nil")
//


