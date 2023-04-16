//
//  main.swift
//  AIOS_HW1_ЛазаревФБ
//
//  Created by Philipp Lazarev on 27.02.2023.
//

import Foundation
import AppKit

/* Задача 1
 
 Для каждого принципа ООП приведите 2-3 примера из жизни.

 - Абстракция
 - Инкапсуляция
 - Наследование
 - Полиморфизм
    */

// ОТВЕТ:
/*
 1) В качестве примера абстрации можно рассмотреть игру в карты. Так, когда мы держим в руках расклад, нас не интересуют дизайн, состояние или же любые свойства карт, кроме как масть и значение. То же самое можно сказать и об условном хранении данных об успеваемости студента в приложении: в перечне оценок нас интересует только предмет, дата выставления оценки и непосредственно значение оценки.
 */

/*
 2) Под инкапсуляцией подразумеваются свойства и методы объектов. Так, например, если мы рассмотрим гаджеты семейства Apple, то каждый из них можно представить в виде определенного класса со своими функциями и значениями. Код примера классов iPhone и Apple Watch ниже
 */

class iPhone {
    let serialNum: String
    let memorySize: Int
    let color: String
    
    func call(contact: String) -> Bool {
        // code here
        return true
    }
    
    func sendMessage(contact: String, message:String) -> Bool {
        // code here
        return true
    }
    
    init(serialNum: String, memorySize: Int, color: String) {
        self.serialNum = serialNum
        self.memorySize = memorySize
        self.color = color
    }
}


class AppleWatch {
    let serialNum: String
    let color: String
    
    func measurePulse() -> Int {
        // code here
        return 60
    }
    
    func measureBloodOxygen() -> Int {
        // code here
        return 100
    }
    
    init(serialNum: String, color: String) {
        self.serialNum = serialNum
        self.color = color
    }
}

/* Другим примером инкапсуляции являются сотрудник магазина и покупать в приложении для онлайн шоппинга.
 */

class Employee {
    var name: String // Переменная, так как имя и фамилия могут меняться в жизни
    var position: String
    
    func completeOrder(order: Int) -> Bool {
        // code here
        return true
    }
    
    func sendOrder(order: Int) -> Bool {
        // code here
        return true
    }
    
    func collectPayment(order: Int) -> Bool {
        // code here
        return true
    }
    
    init(name: String, position: String) {
        self.name = name
        self.position = position
    }
}

class Client {
    var name: String
    var city: String
    var email: String
    var address: String
    
    func checkOut(order: Int) -> Bool {
        // code here
        return true
    }
    
    func pay(for order: Int) -> Bool {
        // code here
        return true
    }
    
    func collectOrder(order: Int) -> Bool {
        // code here
        return true
    }
    
    init(name: String, city: String, email: String, address: String) {
        self.name = name
        self.city = city
        self.email = email
        self.address = address
    }
}

/* 3) Возвращаясь к аналогии с продуктами Apple, в них также можно увидеть определенное наследование. Так, например, если взять iPhone как родительский класс и выделять определенные модели на подклассы, мы увидим, что они обладают общими свойствами: звонить, делать фотографии, работать с заметками и календарем. Но также у них будут и разные функции (например, разблокировка Touch ID в iPhone 8 и Face ID в iPhone X.
 */

class AnyiPhone {
    let serialNum: String
    
    func unlock() -> Bool {
        // code here
        return true
    }
    
    init(serialNum: String) {
        self.serialNum = serialNum
    }
}

class iPhoneX: AnyiPhone {
    override func unlock() -> Bool {
        // unlock with Face ID code
        return true
    }
}

/* Также можно говорить о наследовании, когда речь, например, пойдет, о разработчиках и программистах. Так, iOS и Android-разработчики пишут приложения, но делают это по разному.
 */

class Developer {
    func createApp() {
        // code here
    }
}

class AndroidDeveloper: Developer {
    override func createApp() {
        // creating Android App
    }
}

class iOSDeveloper: Developer {
    override func createApp() {
        // creating iOS App
    }
}

/* 4) Пример - класс Person (человек) и его дочерние классы - Student и Professor. Они обладают общими свойствами, но при этом могут представляться по разному
 */
class Person {
    var name: String
    let birthdate: Date
    var city: String
    
    func introduce(){
        print("Name: \(name). Birthdate: \(birthdate). City: \(city)")
    }
    
    init(name: String, birthdate: Date, city: String) {
        self.name = name
        self.birthdate = birthdate
        self.city = city
    }
}

class Student: Person {
    var group: String
    
    init(name: String, birthdate: Date, city: String, group: String) {
        self.group = group
        super.init(name:name, birthdate:birthdate, city: city)
    }
    
    override func introduce() {
        print("Name: \(name). Birthdate: \(birthdate). City: \(city). Group: \(group)")
    }
}

class Professor: Person {
    var subject: String
    
    init(name: String, birthdate: Date, city: String, subject: String) {
        self.subject = subject
        super.init(name:name, birthdate:birthdate, city: city)
    }
    
    override func introduce() {
        print("Name: \(name). Birthdate: \(birthdate). City: \(city). Subject: \(subject)")
    }
}

/* Другой пример: кошка и собака. И то, и то - животные, но "разговаривают" они по разному*/
class Animal {
    var age: Int
    
    func speak() {
        print("...")
    }
    
    init(age: Int) {
        self.age = age
    }
}

class Dog: Animal {
    override func speak() {
        print("Woof!")
    }
}

class Cat: Animal {
    override func speak() {
        print("Meow!")
    }
}



/* Задача 2
 
 Для каждого базового понятия ООП приведите 2-3 примера из жизни. Опишите их текстом.

 - Класс
 - Объект
 - Свойства объектов
 - Методы
*/

/* В качестве примера класса мы можем опять же взять домашних животных. Так, например, черепашка является классом домашник животных. Она имеет свои свойства: возраст, кличку. Также у неё есть методы: ползти, плавать, отдыхать. При этом конкретная черепашка Donatello или Leonardo будут объектами класса черепашек. Пример кода ниже:*/

class Turtle {
    var name: String
    var accentColor: String
    
    init(name: String, accentColor: String) {
        self.name = name
        self.accentColor = accentColor
    }
    
    func move() {
        print("\(name) is moving")
    }
    
    func swim() {
        print("\(name) is swimming")
    }
    
    func crawl() {
        print("\(name) is crawling")
    }
}

let Donatello = Turtle(name: "Donatello", accentColor: "Purple")
let Leonardo = Turtle(name: "Leonardo", accentColor: "Blue")

Donatello.move()
Leonardo.swim()

/* Также примером класса может быть пользователь приложения, объектом - конкретный пользователь. */
class User {
    let username: String
    var email: String
    
    init(username: String, email: String) {
        self.username = username
        self.email = email
    }
    
    func greet() {
        print("Hello! It's \(username).")
    }
    
    func logIn() {
        print("User \(username) logged in.")
    }
    
    func logOut() {
        print("User \(username) logged out.")
    }
}

let Philipp = User(username: "philipp_lz", email: "severus99@icloud.com")

Philipp.greet()
