/*
Задача 4 * (задача со звездочкой)

Дан массив [1, 2, 3, 4, 7, 8, 15]. Программно найдите индексы двух чисел, которые в сумме дают 6, и распечатайте их в консоль.

Используя цикл решите задачу (рассмотрите возможность использования цикла в цикле).
*/

// В прошлом решении также не учел, что вывести в консоль нужно ИНДЕКСЫ чисел

let numbers = [1, 2, 3, 4, 7, 8, 15, 2, 5, 2, 1, 4, 5, 2, 3, 4, 1, 3, 1, 6, 8, 8, 0]

var solutionNumber1 = [Int]()
var solutionNumber2 = [Int]()

for i in 0..<numbers.count {
    if numbers[i] <= 6 {
        for j in i+1..<numbers.count {
            if numbers[i] + numbers[j] == 6 {
                solutionNumber1.append(i)
                solutionNumber2.append(j)
            }
        }
    }
}

for i in 0..<solutionNumber1.count {
    print("Числа с индексами \(solutionNumber1[i]) и \(solutionNumber2[i]) в сумме дают 6")
}
