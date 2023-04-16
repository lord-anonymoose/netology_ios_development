/*
 Задача 1
 Возьмите любой пример из жизни (класс) и опишите уровни доступа к нему. Постарайтесь описать как публичные, так и закрытые уровни и методы.
 */
/*
 1. Класс: университет
 2. Имеет публичный доступ (каждый может его посетить хотя бы в день открытых дверей
 3. Пример геттера: Узнать стоимость обучения
 4. Пример сеттера: Выбрать специальность для обучения
 5. Пример публичного метода: подать документы для поступления
 6. Пример приватного метода: провести занятие
 */


/*
 Задача 2
 1. Создайте класс.
 2. Создайте три метода с одинаковым названием, но разными сигнатурами. Статический анализатор Swift подскажет вам, если overload не получится ;)
 
 Пример:
 Актер может сниматься:
 - В театральной постановке
 - В кимно
 - В рекламе
 */

enum Genre {
    case comedy
    case musical
    case horror
    case documentary
    case drama
}

class Theatre {
    var name: String
    var city: String
    init(name: String, city: String) {
        self.name = name
        self.city = city
    }
}

class Perfomance {
    var name: String
    var theatre: Theatre
    init(name: String, theatre: Theatre) {
        self.name = name
        self.theatre = theatre
    }
}

class Movie {
    var name: String
    var year: Int
    var genre: Genre
    init(name: String, year: Int, genre: Genre) {
        self.name = name
        self.year = year
        self.genre = genre
    }
}

class Product {
    var name: String
    var brand: String
    init(name: String, brand: String) {
        self.name = name
        self.brand = brand
    }
}

class Actor {
    var name: String
    
    func play(movie: Movie) {
        print("\(self.name) is playing in a movie called \(movie.name)")
    }
    
    func play(perfomance: Perfomance) {
        print("\(self.name) is playing in a perfomance \(perfomance.name) in \(perfomance.theatre.name)")
    }
    
    func play(commercial: Product) {
        print("\(self.name) is promoting \(commercial.name)")
        
    }
    
    init(name: String){
        self.name = name
    }
}

let broadway = Theatre(name: "Broadway", city: "New York")
let theGreatestShowman = Perfomance(name: "The Greatest Showman", theatre: broadway)

let hughJackman = Actor(name: "Hugh Jackman")
let australia = Movie(name: "Australia", year: 2008, genre: Genre.drama)

let lipton = Product(name: "Lipton Iced Tea", brand: "Lipton")

hughJackman.play(perfomance: theGreatestShowman)
hughJackman.play(movie: australia)
hughJackman.play(commercial: lipton)



/*
 Задача 3* (задача со звёздочкой)
 1. Создайте класс-родитель. Определите в нём метод.
 2. Создайте класс-наследник. Переопределите в нём метод родителя, но с вызовом родительского метода.
 */
class Universiy {
    var name: String
    var city: String
    init(name: String, city: String) {
        self.name = name
        self.city = city
    }
}

class Person {
    var name: String
    func attendUniversity(university: Universiy) {
        print("My name is \(name)")
        print("I'm going to university \(university.name)")
    }
    init(name: String) {
        self.name = name
    }
}

class Student: Person {
    override func attendUniversity(university: Universiy) {
        super.attendUniversity(university: university)
        print("I'm attending a class as a student")
    }
}

class Professor: Person {
    override func attendUniversity(university: Universiy) {
        super.attendUniversity(university: university)
        print("I'm teaching a class because I'm a professor")
    }
}

let stanford = Universiy(name: "Stanford University", city: "Stanford")

let ben = Student(name: "Ben Johnson")
let adam = Professor(name: "Adam Lewis")

ben.attendUniversity(university: stanford)
adam.attendUniversity(university: stanford)



/*
 Задача 4* (задача со звёздочкой)

 Напишите по два примера композиции и агрегации из реального мира без использования кода. Каждому примеру дайте объяснение, почему это композиция или агрегация.
 */
/*
 Композиция:
 - Книжная библиотека, соответственно классы библиотека и книга. Если библиотека закроется, книга продолжен существовать (возможно, будет перенесена в другое место)
 - Медиатека пользователя Apple Music. Если пользователь перестанет пользоваться сервисом или же удалит какую-либо песню/альбом из своей медиатеки, то эта песня не перестане существовать
 Агрегация:
 - Квартира и комната. В квартире есть комната, но если квартира перестанет существовать (дом будет снесен), то комната также перестанет существовать
 - Человек и его паспорт. Паспорт нельзя переоформить на другого человека, он принадлежит только одному объекту в течение всей жизни, а после смерти аннулируется
 */
 
