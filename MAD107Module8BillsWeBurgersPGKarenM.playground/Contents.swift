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

var menuDictionary = ["French Fries": (price: 12.25, desc: nil),
                      "Onion Rings": (price: 2.50, desc: "Onion Rings"),
                      "Cheese Stix":(price: 1.25, desc: "Cheese Stix"),
                      "Soda C":(price: 1.00, desc: "Coke"),
                      "Soda RB":(price:1.00, desc: "Root Beer"),
                      "Soda S":(price:1.00, desc: "Sprite"),
                      "Chicken Sandwich":(price:3.25, desc: "Chicken Sandwich with Mayo, Lettuce, Tomato, and Chipotle Sauce"),
                      "Gyro Meal Deal":(price:5.25, desc: "Gyro with French Fries and Homemade Coleslaw"),
                      "Burger - Bacon": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Apple Roasted Bacon, Cheddar, and Mushrooms")
]

enum FoodOrder {
    case burger(String)
    case frenchfries(ffdesc: String, ffprc: Double)
    case softdrink(String, String, Double)
    case chickensandwich(String, Double)
    case gyro(String, Double)
    case onionrings(String, Double)
    case cheesestix(csdesc: String, csprc: Double)
}


var kamffdesc = menuDictionary["French Fries"]
print(kamffdesc)

var kam77 = FoodOrder.frenchfries(ffdesc: kamffdesc?.desc ?? "I want to cry", ffprc: kamffdesc?.price ?? 0)

var kamff = FoodOrder.frenchfries(ffdesc: kamffdesc?.desc ?? "Mega Awesome French Fries", ffprc: kamffdesc?.price ?? 0)
print("this is the most insane thing ever: \(kamffdesc?.desc ?? "wtf")")
print("this is the most insane thing ever2: \(kam77)")
//print("this is the most insane thing ever3: \(ffdesc)")

switch kamff {
    
case .burger(_):
    print("hi1")
case .frenchfries(let ffdesc, let ffprc):
    print("hi1")
    print("Does this thing actually work??? so convoluted... ffdesc: \(ffdesc) ffprc: \(ffprc)")
case .softdrink(_, _, _):
    print("hi1")
case .chickensandwich(_, _):
    print("hi1")
case .gyro(_, _):
    print("hi1")
case .onionrings(_, _):
    print("hi1")
case .cheesestix(_, _):
    print("hi1")
}

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

struct burgerOrdered {
    
    var burgerType: String
    var burgerDesc: String
    var burgerPrice: Double
    
    var testMsg: String {
        return "Excellent choice btw ordering a \(burgerType): \(burgerDesc)"
        
    }
}

struct itemsOrdered {
    
    var itemOrdered: FoodOrder
    
    
    var testMsg2: String {
        return "Thank you for ordering! \(itemOrdered)"
    }
    
    
    
    func printOrder() {
        
        switch itemOrdered {
        case .burger(_):
            print("nice burger")
        case .frenchfries(_, _):
            print("nice fries")
        case .softdrink(_, _, _):
            print("nice soda")
        case .chickensandwich(_, _):
            print("nice chicken sandwich")
        case .gyro(_, _):
            print("nice gyro")
        case .onionrings(_, _):
            print("nice onion rings")
        case .cheesestix(_, _):
            print("nice cheesestix")
        }
    }
    
    
}
var cs = menuDictionary["Cheese Stix"]
var kamcsdesc = cs?.desc
var kamcsprc = cs?.price
var item = itemsOrdered(itemOrdered: FoodOrder.cheesestix(csdesc: kamcsdesc ?? " ", csprc: kamcsprc ?? 0))
print("\n**** item: \(item)")

print("\n\n\(menuDictionary)")
var kamTestOrder1 = menuDictionary["French Fries"]
print(kamTestOrder1)

var ffdesc = kamTestOrder1?.desc
print(ffdesc)
var ffprc = kamTestOrder1?.price
print(ffprc)






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

let taxRateE = 0.075

var itemOrderedE: String = ""
var itemPriceE: Double = 0.00
var tipCalculatedE: Double = 0
var tipCalculated2E: Double = 0
var taxCalculatedE: Double = 0
var orderAmtE: Double = 0
var totalOrderAmtE: Double = 0
    
    
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

print(".............................................................................................................")
print("Items ordered off the menu today include:\n")



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

taxCalculatedE = orderAmtE * taxRateE
tipCalculatedE = orderAmtE * 0.20
//..if calculating as a number and not converting to string
//tipCalculated2 = round(orderAmt * 0.20 * 100)/100

totalOrderAmtE = orderAmtE + taxCalculatedE + tipCalculatedE

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
print("\t\t    *****************")
print("\t\t--> ***   $\(String(format: "%.2f", totalOrderAmtE))")
print("\t\t    *****************")


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
