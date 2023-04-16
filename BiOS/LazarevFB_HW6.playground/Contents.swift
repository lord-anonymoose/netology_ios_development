// Задача 1
/*Вы работаете над приложением "Информация о вас и ваших друзьях". Ваша задача создать список людей с минимальной информацией о них и объединить одно из полей для создания общего значения.*/
var userData1 = (movie: "Shindler's List", number: 5, meal: "Pizza")

let(movie, number, meal) = userData1

var userData2 = (movie: "Green Mile", number: 13, meal: "Cheeseburger")

var temp = userData1

userData1 = userData2

userData2 = temp

var userData3 = (number1: userData1.number, number2: userData2.number, difference: userData1.number - userData2.number)

print(userData3)



// Задача 2
/* Представьте, что вы работаете над приложением электронный дневник. Создайте словарь, где ключом будет имя студента, а значением будет другой словарь из 3 элементов, содержащий название предмета и оценку.*/

var grades: [String:[String:Int]] = [
    "Филипп Лазарев": ["математика":5, "информатика":5, "русский":5],
    "Татьяна Ермакова": ["русский":5, "китайский":5, "обществознание":5],
    "Ричард Сапогов": ["русский":3, "английский":5, "предпринимательство":5]
]

print(grades["Филипп Лазарев"]?["русский"] ?? "Оценка не найдена")



// Задача 3
/* Вы разрабатываете приложение "Шахматы". Вашей задачей будет создать фигуру на игровом поле.*/

typealias Chessman = String
typealias Position = (alpha: Character, num: Double)

var chessmen: [Chessman:Position?] = [
    "Black King" : ("b",4),
    "White King" : ("e",5),
    "White Queen" : (nil),
]

if let info = chessmen["White Queen"] {
    if let sample = info {
        print("The figure is alive")
    } else {
        print("The figure is killed")
    }
} else {
    print("The figure is not found")
}



// Задача 4*
/* Вам необходимо доработать программу из Задачи 3 таким образом, чтобы она автоматически анализировала не одну переданную ей фигуру, а все фигуры, хранящиеся в переменной Chessmans. */

for (man, pos) in chessmen {
    if let info = pos {
        print("The figure \(man) is alive")
    } else {
        print("The figure \(man) is killed")
    }
}
