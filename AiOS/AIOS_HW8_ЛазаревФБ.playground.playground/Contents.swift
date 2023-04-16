/*
 Вы главный архитектор в команде разработчиков.

 Ваша задача — разработать программное обеспечение (ПО) для дилерских центров по продаже автомобилей.

 Ваша цель — создать гибкое ПО. Оно должно подходить для любой марки авто, должно быть расширяемым и масштабируемым в дальнейшем, чтобы ваша компания могла выпускать обновления.

 Задача разделена на четыре части. В каждой из них нужно самостоятельно подумать, какой тип данных передать каждому свойству для комфортной работы, а также при необходимости добавить вспомогательные методы.
 */

import Foundation

/*
 Часть 1

 Сначала нужно описать машину минимальным набором параметров, используя протокол.

 Алгоритм выполнения

 Создайте протокол 'Car'.
 Добавьте в него свойства:
 'model' (только для чтения) — марка;
 'color' (только для чтения) — цвет;
 'buildDate' (только для чтения) — дата выпуска;
 'price' (чтение и запись)— цена авто;
 'accessories' (чтение и запись) — дополнительное оборудование: тонировка, сингнализация, спортивные диски;
 'isServiced' (чтение и запись) — сделана ли предпродажная подготовка. Обычно её делают в дилерских центрах перед постановкой машины в салон.
*/

struct Year: Equatable {
    let rawValue: Int
    
    init?(rawValue: Int) {
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

enum Accessory {
    case tinting
    case alarm
    case sportWheels
    case emergencyPack
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

protocol Car {
    var manufacturer: Manufacturer { get }
    var model: String { get }
    var color: Color { get }
    var buildDate: Year? { get }
    var price: Double { get set }
    var accessories: [Accessory] { get set }
    var isServiced: Bool { get set }
}

struct AnyCar: Car, Equatable {
    var manufacturer: Manufacturer
    var model: String
    var color: Color
    var buildDate: Year?
    var price: Double
    var accessories: [Accessory]
    var isServiced: Bool
    
    static func ==(lhs: AnyCar, rhs: AnyCar) -> Bool {
        return lhs.manufacturer == rhs.manufacturer && lhs.model == rhs.model && lhs.color == rhs.color && lhs.buildDate == rhs.buildDate && lhs.price == rhs.price
    }
}

/*
 Часть 2

 По аналогии с протоколом 'Car' нужно описать дилерский центр минимальным набором свойств и методов, используя протокол.

 Алгоритм выполнения

 1. Создайте протокол 'Dealership'.
 2. Добавьте свойства:
    - 'name' (только для чтения) — название дилерского центра (назвать по марке машины для упрощения);
    - 'showroomCapacity' (только для чтения) — максимальная вместимость автосалона по количеству машин;
    - 'stockCars' (массив, чтение и запись) — машины, находящиеся на парковке склада. Представим, что у парковки нет лимита по количеству машин;
    - 'showroomCars' (массив, чтение и запись) — машины, находящиеся в автосалоне;
    - 'cars' (массив, чтение) — хранит список всех машин в наличии.
 3. Добавьте методы:
    - 'offerAccesories(_ :)' — принимает массив акксесуаров в качестве параметра. Метод предлагает клиенту купить дополнительное оборудование;
    - 'presaleService(_ :)' — принимает машину в качестве параметра. Метод отправляет машину на предпродажную подготовку;
    - 'addToShowroom(_ :)' — также принимает машину в качестве параметра. Метод перегоняет машину с парковки склада в автосалон, при этом выполняет предпродажную подготовку;
    - 'sellCar(_ :)' — также принимает машину в качестве параметра. Метод продаёт машину из автосалона и проверяет, выполнена ли предпродажная подготовка. Если у машины отсутсвует дополнительное оборудование, нужно предложить клиенту его купить (представим, что клиент всегда соглашается и покупает;
    - 'orderCar()' — не принимает и не возвращает параметры. Метод делает заказ новой машины с завода, т. е. добавляет машину на парковку склада. Вы можете использовать как отдельный массив с машинами завода, так и попробовать генерировать машину со случайными характеристиками.
 */

protocol Dealership {
    var name: String { get }
    var showroomCapacity: Int { get set }
    var stockCars: [AnyCar] { get set }
    
    func offerAccessories(_ accessories: [Accessory])
    func presaleService(for car: AnyCar)
    func addToShowroom(_ car: AnyCar)
    func sellCar(_ car: AnyCar)
    func orderCar(_ car: AnyCar)
}

/*
 Часть 3

 Настало время добавить классы и структуры, реализующие созданные ранее протоколы.

 Алгоритм выполнения
 1. Используя структуры, создайте несколько машин разных марок — например, BMW, Honda, Audi, Lexus, Volvo. Все они должны реализовать протокол 'Car'.
 2. Используя классы, создайте пять различных дилерских центров — например, BMW, Honda, Audi, Lexus, Volvo. Все они должны реализовать протокол 'Dealership'. Каждому дилерскому центру добавьте машины на парковку и в автосалон — используйте те машины, которые создали ранее.
 3. Создайте массив, положите в него созданные дилерские центры. Пройдитесь по нему циклом и выведите в консоль слоган для каждого дилеского центра — слоган можно загуглить. Обратите внимание: используйте конструкцию приведения типа данных для решения этой задачи.
 */

// Автомобили

var car1 = AnyCar(manufacturer: .mercedes, model: "GLE 300 D", color: .black, buildDate: Year(rawValue: 2020), price: 7_000_000.0, accessories: [], isServiced: false)
var car2 = AnyCar(manufacturer: .bmw, model: "X5 30d", color: .white, buildDate: Year(rawValue: 2022), price: 14_070_000.0, accessories: [Accessory.tinting], isServiced: true)
var car3 = AnyCar(manufacturer: .audi, model: "A6 45 TDI", color: .red, buildDate: Year(rawValue: 2019), price: 7_120_000.0, accessories: [Accessory.alarm, Accessory.tinting, Accessory.sportWheels], isServiced: true)
var car4 = AnyCar(manufacturer: .audi, model: "A6 40 TFSI", color: .black, buildDate: Year(rawValue: 2019), price: 8_990_000.0, accessories: [Accessory.alarm, Accessory.tinting, Accessory.sportWheels], isServiced: false)
var car5 = AnyCar(manufacturer: .porsche, model: "Taycan 4 Cross Turismo", color: .black, buildDate: Year(rawValue: 2022), price: 18_000_000.0, accessories: [], isServiced: true)
var car6 = AnyCar(manufacturer: .porsche, model: "Taycan 4 Cross Turismo", color: .white, buildDate: Year(rawValue: 2022), price: 17_500_000.0, accessories: [], isServiced: true)
var car7 = AnyCar(manufacturer: .tesla, model: "Model 3 Long Range", color: .white, buildDate: Year(rawValue: 2019), price: 7_000_000.0, accessories: [], isServiced: false)
var car8 = AnyCar(manufacturer: .tesla, model: "Model 3 Long Range", color: .red, buildDate: Year(rawValue: 2019), price: 7_600_000.0, accessories: [], isServiced: true)
var car9 = AnyCar(manufacturer: .kia, model: "EV6 Long Range", color: .blue, buildDate: Year(rawValue: 2022), price: 6_000_000.0, accessories: [], isServiced: true)
var car10 = AnyCar(manufacturer: .kia, model: "Sorento", color: .white, buildDate: Year(rawValue: 2020), price: 4_800_000.0, accessories: [Accessory.tinting, Accessory.alarm], isServiced: true)
var car11 = AnyCar(manufacturer: .kia, model: "Sportage", color: .white, buildDate: Year(rawValue: 2022), price: 4_000_000.0, accessories: [Accessory.alarm], isServiced: true)
var car12 = AnyCar(manufacturer: .kia, model: "S-Class 580 Long 4MATIC", color: .black, buildDate: Year(rawValue: 2021), price: 19_790_000.0, accessories: [], isServiced: true)

// Дилерские центры

// Родительский класс ООО "Дилершип Компани"
class DealershipCompany: Dealership {
    var name: String
    var showroomCapacity: Int
    var stockCars: [AnyCar]
    var motto: String
    
    func offerAccessories(_ accessories: [Accessory]) {
        if accessories.count == 0 {
            print("No accessories to offer!")
        } else {
            for accessory in accessories {
                print("We have a great deal on \(accessory) today! Let's get it for your new car!")
            }
        }
    }
    
    func presaleService(for car: AnyCar) {
        print("\(car.manufacturer.rawValue) \(car.model) is sent for presale service.")
        print("Doing presale service...")
        sleep(3)
        print("Presale service for \(car.manufacturer.rawValue) \(car.model) is done!")
    }
    
    func addToShowroom(_ car: AnyCar) {
        self.stockCars.append(car)
        print("\(car.manufacturer.rawValue) \(car.model) has been added to \(self.name) showroom.")
    }
    
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
            addToShowroom(car)
        }
    }
    
    init(name: String, showroomCapacity: Int, stockCars: [AnyCar], motto: String) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.motto = motto
    }
}

var moscowDealership = DealershipCompany(name: "Moscow Dealership", showroomCapacity: 40, stockCars: [car1, car5, car6, car12], motto: "Ваша мечта на колесах - в нашем автосалоне!")
var petersburgDealership = DealershipCompany(name: "Saint-Petersburg Dealership", showroomCapacity: 30, stockCars: [car2, car3], motto: "Воплотите свои автомобильные мечты с нами!")
var kazanDealership = DealershipCompany(name: "Kazan Dealership", showroomCapacity: 25, stockCars: [car4, car7], motto: "Достигайте автомобильных вершин вместе с нами!")
var murmanskDealership = DealershipCompany(name: "Murmansk Dealership", showroomCapacity: 15, stockCars: [car8, car9], motto: "Ваша мечта на колесах - воплотим в реальность!")
var tulaDealership = DealershipCompany(name: "Tula Dealership", showroomCapacity: 15, stockCars: [car10, car11], motto: "Доверьте нам свою мечту на колесах, мы сделаем ее реальностью!")

moscowDealership.offerAccessories([Accessory.alarm, Accessory.tinting])

petersburgDealership.sellCar(car2)

petersburgDealership.orderCar(car1)

petersburgDealership.sellCar(car1)

moscowDealership.sellCar(car2)

var localDealership = [moscowDealership, petersburgDealership, kazanDealership, murmanskDealership, tulaDealership]

for dealership in localDealership {
    print("\(dealership.name) - \(dealership.motto)")
}

/*
 Часть 4
 Работа с расширениями. Вам нужно добавить спецпредложение для машин прошлого года.

 Алгоритм выполнения

 1. Сделайте расширения для протокола 'Car'.
 Добавьте методы:
 - 'addEmergencyPack()' — не принимает никаких параметров. Метод добавляет аптечку и огнетушитель к дополнительному оборудованию машины;
 - 'makeSpecialOffer()' — не принимает никаких параметров. Метод проверяет дату выпуска авто: если год выпуска машины меньше текущего, нужно сделать скидку 15%, добавить аптечку и огнетушитель.
 2. Проверьте все машины в дилерском центре, возможно, они нуждаются в специальном предложении. Нужно помнить, что массивы — это структуры, и они изменяются, только если изменится состав этих элементов (См. copy-on-write).
*/

extension Car {
    mutating func addEmergencyPack() {
        self.accessories.append(.emergencyPack)
    }
    
    mutating func makeSpecialOffer() {
        var newPrice = self.price * 0.85
        return newPrice
    }
}

for dealership in localDealership {
    for car in dealership.stockCars {
        car.addEmergencyPack()
        /*
        if car.buildDate == Year(rawValue: 2022) {
            let newPricedCar = car.makeSpecialOffer()
            
        }
        */
    }
}
