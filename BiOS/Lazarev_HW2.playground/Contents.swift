// №1
/*
 Лазарев Филипп
 
 Мне 23 года, я работаю старшим инженером-тестировщиком в компании ООО "Дататех". Начиная со школы, я увлекся техникой Apple и мечтал стать iOS-разработчиком. Сейчас я иду к этой мечте.
 
 Стек: Python, SQL, PL/SQL
 
 ПО: QT, Dbeaver, SAP PowerDesigner, MS Office, iWork, iMovie
 
 Работал в компаниях: EF English First, Философия.ИТ, Дататех
 
 Образование: РТУ МИРЭА (2017 - 2023)
*/



// №2
var firstName: String = "Филипп"            // Может быть изменено
var secondName: String = "Лазарев"          // Может быть изменено
var age: Int = 23                           // Может быть изменено, округлено до целых
var gender: String = "Мужчина"              // Может быть изменено
var preferredLocation: String = "Дублин"    // Может быть изменено
var usedMac: Bool = true                    // Может быть изменено
var preferredSalary: Int = 200_000          // Может быть изменено
var preferredVacationLength: Int = 20       // Может быть изменено
var preferredColor: String = "Зеленый"      // Может быть изменено
// Хотя я не планирую менять большую часть из этих переменных, для других пользователей такая возможность должна быть предусмотрена :)



// №3
var iosMiddleDevSalary: Float = 150_000
var iosJuniorDevSalary: Float = 80_000
var androidMiddleSalary: Float = 140_000

iosMiddleDevSalary *= 1.2
iosJuniorDevSalary += Float(20_000)

func noTrailingZero(input: Float) -> String {
    if input.remainder(dividingBy: 1.0) == 0 {
        return String(String(input).dropLast(2))
    } else {
        return String(input)
    }
}

let iosMiddleOutput = noTrailingZero(input: iosMiddleDevSalary)
let iosJuniorOutput = noTrailingZero(input: iosJuniorDevSalary)
let androidMiddleOutput = noTrailingZero(input: androidMiddleSalary)

print ("Обновленная зарплата Middle iOS-разработчика составляет \(iosMiddleOutput)")
print ("Обновленная зарплата Junior iOS-разработчика составляет \(iosJuniorOutput)")
print ("Обновленная зарплата Middle Android-разработчика составляет \(androidMiddleOutput)")

