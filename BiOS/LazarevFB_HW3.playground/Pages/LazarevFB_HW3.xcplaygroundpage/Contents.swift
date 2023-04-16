// Task № 1

let january = "январь"

let february = "февраль"

let march = "март"

let april = "апрель"

let may = "май"

let june = "июнь"

let july = "июль"

let august = "август"

let september = "сентябрь"

let october = "октябрь"

let november = "ноябрь"

let december = "декабрь"

var holidays = 8


var selectedMonth = "июль"

// Отбрасывем ошибки ввода из-за регистра
selectedMonth = selectedMonth.lowercased()

if january == selectedMonth {
    holidays += 8
} else if (february == selectedMonth) || (march == selectedMonth) || (may == selectedMonth) || (june == selectedMonth) || (november == selectedMonth) {
    holidays += 1
} else if (april == selectedMonth) || (july == selectedMonth) || (august == selectedMonth) || (september == selectedMonth) || (october == selectedMonth) || (december == selectedMonth) {
    holidays += 0
} else {
    print("Введен неизвестный месяц!")
}

print ("В месяце \"\(selectedMonth)\" есть \(holidays) выходных дней")



// Task №2

holidays = 8

switch selectedMonth {
case january:
    holidays += 8
case february, march, may, june, november:
    holidays += 1
case april, july, august, september, october, december:
    holidays += 0
default:
    print("Введен неизвестный месяц!")
}
print ("В месяце \"\(selectedMonth)\" есть \(holidays) выходных дней")



// Task №3
func checkHoliday (isHoliday: Bool) {
    isHoliday ? (print("Это выходной")) : (print("Это рабочий день"))
}

checkHoliday(isHoliday: Bool.random())



// Task №4
enum Month {
    case january, february, march, april, may, june, july, august, september, october, november, december
    var holidays: String {
        switch self {
        case .january:
            return "16"
        case .february, .march, .may, .june, .november:
            return "9"
        case .april, .july, .august, .september, .october, .december:
            return "8"
        }
    }
}

var myMonth =  Month.july
print("В данном месяце \(myMonth.holidays) выходных дней")
