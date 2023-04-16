// № 1
var maleStudents: [String] = ["Maxim Popov", "Nikita Karimov"]

var femaleStudents: [String] = ["Tatiana Ermakova", "Natalia Lazareva", "Elizaveta Safonova"]

var students = [String]()

maleStudents.forEach {students.insert($0, at: 0)}

femaleStudents.forEach {students.append($0)}

print(students)



// № 2
students = students.sorted(by: <)

students = students.sorted(by: >)

 print(students)



 // № 3
 var reviews: [Int8] = [5, 5, 5, 4, 3, -2, 3, -1, 5, -2, -2, 4, 5, -3]

 reviews = reviews.sorted(by: >)
 
 reviews = reviews.filter {$0 > 0}
 
 print (reviews)



// № 4
let myNumbers = [1, 2, 3, 4, 7, 8, 15]

var number1 = -1
var number2 = -1

for i in 0..<myNumbers.count {
    if myNumbers[i] < 6 {
        for j in (i+1)..<myNumbers.count {
            if (myNumbers[i] + myNumbers[j] == 6) {
                number1 = myNumbers[i]
                number2 = myNumbers[j]
            }
        }
    }
}

print ("\(number1) + \(number2) = 6")
