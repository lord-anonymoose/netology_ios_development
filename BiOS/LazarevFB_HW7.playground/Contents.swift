import Foundation //Для функции floor

//Задача 1

/* В данной задаче вы тренируетесь добавлять и удалять значения в Хранилище (массив) при помощи двух функций, которые вам и нужно реализовать. Функции принимают значение, но ничего не возвращают. Первая функция добавляет элемент в массив, вторая функция удаляет элемент из массива, вы сами можете выбрать любой удобный для вас вариант добавления и удаления элементов из массива.*/

var appleDevices: [String] = [String]()


func addDevice(_ device: String, to array:[String]) -> [String] {
    var resultArray = array
    resultArray.append(device)
    return resultArray
}


func removeDevice(_ device: String, from array:[String]) -> [String] {
    var resultArray = array
    if resultArray.count == 0 {
        print("Array is empty! Could not remove an element from empty array")
    } else if array.firstIndex(of: device) == nil {
        print("Could not find an element \"\(device)\" to remove")
    } else {
        resultArray = resultArray.filter {$0 != device}
    }
    return resultArray
}

appleDevices = addDevice("iPhone 12", to: appleDevices)
appleDevices = addDevice("iPhone 13", to: appleDevices)
appleDevices = addDevice("iPhone 14", to: appleDevices)
appleDevices = addDevice("iPhone 14 Plus", to: appleDevices)
appleDevices = addDevice("iPhone 14 Pro", to: appleDevices)
appleDevices = addDevice("iPhone 14 Pro Max", to: appleDevices)

appleDevices = removeDevice("iPhone 12", from: appleDevices)
appleDevices = removeDevice("iPhone 12 Pro", from: appleDevices)
appleDevices = removeDevice("iPhone 12 Pro Max", from: appleDevices)
appleDevices = removeDevice("iPhone 11", from: appleDevices)
appleDevices = removeDevice("iPhone Xr", from: appleDevices)

print(appleDevices)



//Задача 2

/* Вы получили тестовое задание от службы доставки еды: преобразовать бонусные баллы клиентов, которые хранятся на сайте, в денежные единицы. Со стороны сайта приходит словарь, содержащий ID клиента (Int) и накопленную сумму Бонусов (Double). Ваша задача вернуть на сайт словарь, содержащий ID клиента (Int) и конвертированные денежные единицы (Int), каждые 100 бонусов равны 10 денежным единицам.*/

// Тестовый набор данных
let myDict: [Int:Double] = [
    1: 100.0,
    2: 100.3,
    3: 400.4,
    6: 2000.0
]

// Коэффициентом считаю число типа Double, на которое умножается исходное количество бонусных баллов у клиента
func getNewPoint (from dict: [Int:Double], with ratio: Double) -> [Int:Int] {
    var resultDict = [Int:Int]()
    for (userID, userPoints) in dict {
        var rur = Int(floor(userPoints * ratio / 10))
        resultDict[userID] = rur
    }
    return resultDict
}

print(getNewPoint (from: myDict, with: 1.2))


// Задача 3*
/* Вам необходимо реализовать функцию, которая принимаем массив опциональных значений типа Integer и возвращает кортеж, в который необходимо передать сумму четных и нечетных значений.*/
var arrayOfNumbers: [Int?] = [1, 2, nil, 12, 1, nil, 3, 2]

func countParity (of array: [Int?]) -> (odd: Int, even:Int) {
    var oddSum = 0
    var evenSum = 0
    var arraySet = Set(array)
    
    for i in arraySet {
        if let number = i {
            if number % 2 == 0 {
                evenSum += number
            } else {
                oddSum += number
            }
        }
    }
    var result = (odd: oddSum, even: evenSum)
    return result
}

var myParity = countParity(of: arrayOfNumbers)

print ("Summary of odd numbers is \(myParity.odd)")
print ("Summary of even numbers is \(myParity.even)")
