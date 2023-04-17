import Foundation

// Basic measures
struct Year: Equatable {
    let rawValue: Int
    
    init?(_ rawValue: Int) {
        guard rawValue >= 1900 && rawValue <= 2999 else { return nil }
        self.rawValue = rawValue
    }
    
    static func ==(lhs: Year, rhs: Year) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

enum Color {
    case black
    case white
    case silver
    case grey
    case green
    case red
    case pink
    case gold
    case blue
}

enum Accessory: String {
    case tinting = "Tinting"
    case alarm = "Alarm"
    case sportWheels = "Sport Wheels"
    case emergencyPack = "Emergency Pack"
}

enum Manufacturer: String {
    case mercedes = "Mercedes-Benz"
    case bmw = "BMV"
    case nissan = "Nissan"
    case honda = "Honda"
    case audi = "Audi"
    case lexus = "Lexus"
    case volvo = "Volvo"
    case tesla = "Tesla"
    case kia = "KIA"
    case porsche = "Porsche"
}



// Car
protocol Car {
    var manufacturer: Manufacturer { get }
    var model: String { get }
    var color: Color { get }
    var buildDate: Year? { get }
    var price: Double { get set }
    var accessories: [Accessory] { get set }
    var isServiced: Bool { get set }
}

extension Car {
    mutating func addEmergencyPack() {
        if !(self.accessories.contains(.emergencyPack)) {
            self.accessories.append(.emergencyPack)
            print("Emergency pack has been added to \(self.manufacturer.rawValue) \(self.model) Accessory Package.")
        } else {
            print("\(self.manufacturer.rawValue) \(self.model) Accessory Package already includes an Emergency Pack.")
        }
    }
    
    mutating func makeSpecialOffer() {
        if self.buildDate == Year(2022) {
            self.price = self.price * 0.85
            print("\(self.manufacturer.rawValue) \(self.model) has been discounted to a new price: \(self.price).")
        } else {
            print("\(self.manufacturer.rawValue) \(self.model) does not conform to discounting policies.")
        }
    }
}

struct AnyCar: Car, Equatable {
    var id: UUID = UUID()
    var manufacturer: Manufacturer
    var model: String
    var color: Color
    var buildDate: Year?
    var price: Double
    var accessories: [Accessory]
    var isServiced: Bool
    
    static func ==(lhs: AnyCar, rhs: AnyCar) -> Bool {
        return lhs.id == rhs.id
    }
}

var car1 = AnyCar(manufacturer: .mercedes, model: "GLE 300 D", color: .black, buildDate: Year(2020), price: 85_800.0, accessories: [], isServiced: false)

var car2 = AnyCar(manufacturer: .bmw, model: "X5 30d", color: .white, buildDate: Year(2022), price: 172_500.0, accessories: [Accessory.tinting], isServiced: true)

var car3 = AnyCar(manufacturer: .audi, model: "A6 45 TDI", color: .red, buildDate: Year(2019), price: 85_500.0, accessories: [Accessory.alarm, Accessory.tinting, Accessory.sportWheels], isServiced: true)

var car4 = AnyCar(manufacturer: .audi, model: "A6 40 TFSI", color: .black, buildDate: Year(2019), price: 110_000.0, accessories: [Accessory.alarm, Accessory.tinting, Accessory.sportWheels], isServiced: false)

var car5 = AnyCar(manufacturer: .porsche, model: "Taycan 4 Cross Turismo", color: .black, buildDate: Year(2022), price: 18_000_000.0, accessories: [], isServiced: true)

var car6 = AnyCar(manufacturer: .porsche, model: "Taycan 4 Cross Turismo", color: .white, buildDate: Year(2022), price: 220_000.0, accessories: [], isServiced: true)

var car7 = AnyCar(manufacturer: .tesla, model: "Model 3 Long Range", color: .white, buildDate: Year(2019), price: 85_800.0, accessories: [], isServiced: false)

var car8 = AnyCar(manufacturer: .tesla, model: "Model 3 Long Range", color: .red, buildDate: Year(2019), price: 85_800.0, accessories: [], isServiced: true)

var car9 = AnyCar(manufacturer: .kia, model: "EV6 Long Range", color: .blue, buildDate: Year(2022), price: 73_615.00, accessories: [], isServiced: true)

var car10 = AnyCar(manufacturer: .kia, model: "Sorento", color: .white, buildDate: Year(2020), price: 58_800.0, accessories: [Accessory.tinting, Accessory.alarm], isServiced: true)

var car11 = AnyCar(manufacturer: .kia, model: "Sportage", color: .white, buildDate: Year(2022), price: 49_000.0, accessories: [Accessory.alarm], isServiced: true)

var car12 = AnyCar(manufacturer: .kia, model: "S-Class 580 Long 4MATIC", color: .black, buildDate: Year(2021), price: 200_000.0, accessories: [], isServiced: true)



// Warehouse
protocol Warehouse {
    var name: String { get }
    var capacity: Int { get set }
    var stockCars: [AnyCar] { get set }
    
    func orderCar(_ car: AnyCar)
}

class AnyWarehouse: Warehouse {
    var name: String
    var capacity: Int
    var stockCars: [AnyCar]
    
    func orderCar(_ car: AnyCar) {
        self.stockCars.append(AnyCar(manufacturer: car.manufacturer, model: car.model, color: car.color, price: car.price, accessories: car.accessories, isServiced: car.isServiced))
    }
    
    init(name: String, capacity: Int, stockCars: [AnyCar]) {
        self.name = name
        self.capacity = capacity
        self.stockCars = stockCars
    }
}

var warehouse = AnyWarehouse(name: "Main Warehouse", capacity: 1000, stockCars: [car1, car2, car3, car4, car5, car6, car7, car8, car9, car10, car11, car12])



// Dealership
protocol Dealership {
    var name: String { get }
    var showroomCapacity: Int { get set }
    var stockCars: [AnyCar] { get set }
    var motto: String { get }
    
    func offerAccessories(_ accessories: [Accessory], for car: AnyCar)
    func presaleService(for car: AnyCar)
    func addToShowroom(_ car: AnyCar, from warehouse: AnyWarehouse)
    func sellCar(_ car: AnyCar)
    func orderCar(_ car: AnyCar)
}

class AnyDealership: Dealership {
    var name: String
    var showroomCapacity: Int
    var stockCars: [AnyCar]
    var motto: String
    
    // Done
    func offerAccessories(_ accessories: [Accessory], for car: AnyCar) {
        if accessories.count == 0 {
            print("No accessories to offer!")
        } else {
            var index: Int = -1
            for i in 0...self.stockCars.count - 1 {
                if self.stockCars[i] == car {
                    index = i
                }
            }
            var newCar = car
            for accessory in accessories {
                if !newCar.accessories.contains(accessory) {
                    print("We have a great deal on \(accessory.rawValue) today! Let's get it for your new car!")
                    newCar.price = newCar.price + 5_000.0
                    newCar.accessories.append(accessory)
                }
            }
            if index > -1 {
                print(index)
                self.stockCars[index] = newCar
            } else {
                print("\(car.manufacturer) \(car.model) is not in \(self.name).")
            }
        }
    }
    
    // Done
    func presaleService(for car: AnyCar) {
        var index: Int = -1
        for i in 0...self.stockCars.count - 1 {
            if self.stockCars[i] == car {
                index = i
            }
        }
        var newCar = car
        if !car.isServiced {
            print("\(car.manufacturer.rawValue) \(car.model) is sent for presale service.")
            print("Doing presale service...")
            sleep(3)
            newCar.isServiced.toggle()
            self.stockCars[index] = newCar
            print("\(car.manufacturer.rawValue) \(car.model) is successfully serviced.")
        } else {
            print("\(car.manufacturer.rawValue) \(car.model) is already serviced.")
        }
    }
    
    // Done
    func addToShowroom(_ car: AnyCar, from warehouse: AnyWarehouse) {
        let i = warehouse.stockCars.firstIndex(of: car)
        if let i = warehouse.stockCars.firstIndex(of: car) {
            warehouse.stockCars.remove(at: i)
            self.stockCars.append(car)
        } else {
            print("\(car.manufacturer) \(car.model) is not found in our warehouse.")
        }
        print("")
    }
    
    // Done
    func sellCar(_ car: AnyCar) {
        if let index = stockCars.firstIndex(of: car) {
            stockCars.remove(at: index)
            print("\(car.manufacturer.rawValue) \(car.model) is sold! Congratulations on your new purchase!")
        } else {
            print("Unfortunately, we don't have \(car.manufacturer.rawValue) \(car.model) in our showroom at the moment")

        }
    }
    
    func orderCar(_ car: AnyCar) {
        if stockCars.count < showroomCapacity {
            print("Ordered \(car.manufacturer.rawValue) \(car.model) for our showroom...")
            sleep(5)
            print("\(car.manufacturer.rawValue) \(car.model) has arrived!")
        }
    }
    
    init(name: String, showroomCapacity: Int, stockCars: [AnyCar], motto: String) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.motto = motto
    }
}

var newYork = AnyDealership(name: "New York Dealership", showroomCapacity: 40, stockCars: [], motto: "Drive with confidence, choose our dealership for excellence.")

var losAngeles = AnyDealership(name: "Los-Angeles Dealership", showroomCapacity: 30, stockCars: [], motto: "Our passion drives us to put you behind the wheel.")

var cupertino = AnyDealership(name: "Cupertino Dealership", showroomCapacity: 10, stockCars: [], motto: "Experience the thrill of the ride with us.")

var austin = AnyDealership(name: "Austin Dealership", showroomCapacity: 30, stockCars: [], motto: "Where your dream ride comes to life.")

var washington = AnyDealership(name: "Washington Dealership", showroomCapacity: 20, stockCars: [], motto: "Find your drive with us.")

// Debugging
// addToShowroom
print(car1.id)
newYork.addToShowroom(car1, from: warehouse)
print(newYork.stockCars)

// offerAccessories
print(newYork.stockCars[0].price)
print(newYork.stockCars[0].accessories)
newYork.offerAccessories([.tinting], for: car1)
print(newYork.stockCars[0].price)
print(newYork.stockCars[0].accessories)

// presaleService
print(newYork.stockCars[0].isServiced)
newYork.presaleService(for: newYork.stockCars[0])
print(newYork.stockCars[0].isServiced)

// sellCar
print(newYork.stockCars)
newYork.sellCar(newYork.stockCars[0])
print(newYork.stockCars)

