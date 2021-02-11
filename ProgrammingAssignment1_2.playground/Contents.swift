
import Foundation

// Частина 1

// Дано рядок у форматі "Student1 - Group1; Student2 - Group2; ..."

let studentsStr = "Дмитренко Олександр - ІП-84; Матвійчук Андрій - ІВ-83; Лесик Сергій - ІО-82; Ткаченко Ярослав - ІВ-83; Аверкова Анастасія - ІО-83; Соловйов Даніїл - ІО-83; Рахуба Вероніка - ІО-81; Кочерук Давид - ІВ-83; Лихацька Юлія- ІВ-82; Головенець Руслан - ІВ-83; Ющенко Андрій - ІО-82; Мінченко Володимир - ІП-83; Мартинюк Назар - ІО-82; Базова Лідія - ІВ-81; Снігурець Олег - ІВ-81; Роман Олександр - ІО-82; Дудка Максим - ІО-81; Кулініч Віталій - ІВ-81; Жуков Михайло - ІП-83; Грабко Михайло - ІВ-81; Іванов Володимир - ІО-81; Востриков Нікіта - ІО-82; Бондаренко Максим - ІВ-83; Скрипченко Володимир - ІВ-82; Кобук Назар - ІО-81; Дровнін Павло - ІВ-83; Тарасенко Юлія - ІО-82; Дрозд Світлана - ІВ-81; Фещенко Кирил - ІО-82; Крамар Віктор - ІО-83; Іванов Дмитро - ІВ-82"

// Завдання 1
// Заповніть словник, де:
// - ключ – назва групи
// - значення – відсортований масив студентів, які відносяться до відповідної групи

var studentsGroups: [String: [String]] = [:]

// Ваш код починається тут
let studentsArr = studentsStr.components(separatedBy: "; ")
for student in studentsArr {
    let studentValues = student.components(separatedBy: "- ")
    let group = studentValues[1]
    let name = studentValues[0].trimmingCharacters(in: .whitespacesAndNewlines)
    studentsGroups[group] == nil ? studentsGroups[group] = [name] : studentsGroups[group]!.append(name)
}
for group in studentsGroups.keys {
    studentsGroups[group]!.sort {$0 < $1}
}
// Ваш код закінчується тут

print("Завдання 1")
print(studentsGroups)
print()

// Дано масив з максимально можливими оцінками

let points: [Int] = [12, 12, 12, 12, 12, 12, 12, 16]

// Завдання 2
// Заповніть словник, де:
// - ключ – назва групи
// - значення – словник, де:
//   - ключ – студент, який відносяться до відповідної групи
//   - значення – масив з оцінками студента (заповніть масив випадковими значеннями, використовуючи функцію `randomValue(maxValue: Int) -> Int`)

func randomValue(maxValue: Int) -> Int {
    switch(arc4random_uniform(6)) {
    case 1:
        return Int(ceil(Float(maxValue) * 0.7))
    case 2:
        return Int(ceil(Float(maxValue) * 0.9))
    case 3, 4, 5:
        return maxValue
    default:
        return 0
    }
}

var studentPoints: [String: [String: [Int]]] = [:]

// Ваш код починається тут
for(key, value) in studentsGroups {
    var dictWithPoints: [String : [Int]] = [:]
    value.forEach { name in
        let currStudGrades = points.map {randomValue(maxValue: $0)}
        dictWithPoints[name] = currStudGrades
    }
    studentPoints[key] = dictWithPoints
}

// Ваш код закінчується тут

print("Завдання 2")
print(studentPoints)
print()

// Завдання 3
// Заповніть словник, де:
// - ключ – назва групи
// - значення – словник, де:
//   - ключ – студент, який відносяться до відповідної групи
//   - значення – сума оцінок студента

var sumPoints: [String: [String: Int]] = [:]

// Ваш код починається тут
for (key, value) in studentPoints {
    var dictWithPointsSums: [String : Int] = [:]
    value.forEach {name, points in
        let sum = points.reduce(0){$0 + $1}
        dictWithPointsSums[name] = sum
    }
    sumPoints[key] = dictWithPointsSums
}


// Ваш код закінчується тут

print("Завдання 3")
print(sumPoints)
print()

// Завдання 4
// Заповніть словник, де:
// - ключ – назва групи
// - значення – середня оцінка всіх студентів групи

var groupAvg: [String: Float] = [:]

// Ваш код починається тут
for(key, value) in sumPoints{
    var sum: Float = 0.0;
    value.forEach {_, points in
        sum += Float(points)
    }
    groupAvg[key] = sum/Float(value.count)
}


// Ваш код закінчується тут

print("Завдання 4")
print(groupAvg)
print()

// Завдання 5
// Заповніть словник, де:
// - ключ – назва групи
// - значення – масив студентів, які мають >= 60 балів

var passedPerGroup: [String: [String]] = [:]

// Ваш код починається тут
for (key, value) in sumPoints {
    let filtered = value.filter {$0.1 >= 60}
    passedPerGroup[key] = Array(filtered.keys)
}

// Ваш код закінчується тут

print("Завдання 5")
print(passedPerGroup)

// Приклад виведення. Ваш результат буде відрізнятися від прикладу через використання функції random для заповнення масиву оцінок та через інші вхідні дані.
//
//Завдання 1
//["ІВ-73": ["Гончар Юрій", "Давиденко Костянтин", "Капінус Артем", "Науменко Павло", "Чередніченко Владислав"], "ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-71": ["Андрющенко Данило", "Гуменюк Олександр", "Корнійчук Ольга", "Музика Олександр", "Трудов Антон", "Феофанов Іван"]]
//
//Завдання 2
//["ІВ-73": ["Давиденко Костянтин": [5, 8, 9, 12, 11, 12, 0, 0, 14], "Капінус Артем": [5, 8, 12, 12, 0, 12, 12, 12, 11], "Науменко Павло": [4, 8, 0, 12, 12, 11, 12, 12, 15], "Чередніченко Владислав": [5, 8, 12, 12, 11, 12, 12, 12, 15], "Гончар Юрій": [5, 6, 0, 12, 0, 11, 12, 11, 14]], "ІВ-71": ["Корнійчук Ольга": [0, 0, 12, 9, 11, 11, 9, 12, 15], "Музика Олександр": [5, 8, 12, 0, 11, 12, 0, 9, 15], "Гуменюк Олександр": [5, 8, 12, 9, 12, 12, 11, 12, 15], "Трудов Антон": [5, 0, 0, 11, 11, 0, 12, 12, 15], "Андрющенко Данило": [5, 6, 0, 12, 12, 12, 0, 9, 15], "Феофанов Іван": [5, 8, 12, 9, 12, 9, 11, 12, 14]], "ІВ-72": ["Киба Олег": [5, 8, 12, 12, 11, 12, 0, 0, 11], "Овчарова Юстіна": [5, 8, 12, 0, 11, 12, 12, 12, 15], "Бортнік Василь": [4, 8, 12, 12, 0, 12, 9, 12, 15], "Тимко Андрій": [0, 8, 11, 0, 12, 12, 9, 12, 15]]]
//
//Завдання 3
//["ІВ-72": ["Бортнік Василь": 84, "Тимко Андрій": 79, "Овчарова Юстіна": 87, "Киба Олег": 71], "ІВ-73": ["Капінус Артем": 84, "Науменко Павло": 86, "Чередніченко Владислав": 99, "Гончар Юрій": 71, "Давиденко Костянтин": 71], "ІВ-71": ["Корнійчук Ольга": 79, "Трудов Антон": 66, "Андрющенко Данило": 71, "Гуменюк Олександр": 96, "Феофанов Іван": 92, "Музика Олександр": 72]]
//
//Завдання 4
//["ІВ-71": 79.333336, "ІВ-72": 80.25, "ІВ-73": 82.2]
//
//Завдання 5
//["ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-73": ["Давиденко Костянтин", "Капінус Артем", "Чередніченко Владислав", "Гончар Юрій", "Науменко Павло"], "ІВ-71": ["Музика Олександр", "Трудов Антон", "Гуменюк Олександр", "Феофанов Іван", "Андрющенко Данило", "Корнійчук Ольга"]]

class TimeDK {
    var hour: UInt
    var minute: UInt
    var second: UInt
    
    init() {
        self.hour = 0
        self.minute = 0
        self.second = 0
    }
    
    init?(h: UInt, m: UInt, s: UInt) {
        if(h > 23 || m > 59 || s > 59) {
            return nil
        }
        self.hour = h
        self.minute = m
        self.second = s
    }
    
    init(date: Date) {
        self.hour = UInt(Calendar.current.component(.hour, from: date))
        self.minute = UInt(Calendar.current.component(.minute, from: date))
        self.second = UInt(Calendar.current.component(.second, from: date))
    }
    
    func get24Time() -> String {
        return (hour < 10 ? "0" : "") + String(hour) + ":" + (minute < 10 ? "0" : "") + String(minute) + ":" + (second < 10 ? "0" : "") + String(second)
    }
}
extension TimeDK {
    func getTime() -> String {
        var result = ""
        if(hour >= 12) {
            let stringH = String(hour == 12 ? 12 : (hour - 12))
            result += (stringH.count == 1 ? "0" : "") + stringH + ":" + (minute < 10 ? "0" : "") + String(minute) + ":" + (second < 10 ? "0" : "") + String(second) + " PM"
        } else {
            result += (hour < 10 ? "0" : "") + String(hour) + ":" + (minute < 10 ? "0" : "") + String(minute) + ":" + (second < 10 ? "0" : "") + String(second) + " AM"
        }
        return result
    }
    func getTimeSum(secondObject: TimeDK) -> TimeDK {
        var secondsSum = self.second + secondObject.second
        var minutesSum = (secondsSum >= 60 ? 1 : 0) + self.minute + secondObject.minute
        let hoursSum = ((minutesSum >= 60 ? 1 : 0) + self.hour + secondObject.hour) % 24
        minutesSum = minutesSum % 60
        secondsSum = secondsSum % 60
        
        let res = TimeDK(h: hoursSum, m: minutesSum, s: secondsSum)
        return res!
    }
    
    func getTimeDifference(secondObject: TimeDK) -> TimeDK {
        var secondsDiff = Int(self.second) - Int(secondObject.second)
        var minutesDiff = Int(self.minute) - Int(secondObject.minute) - (secondsDiff < 0 ? 1 : 0)
        var hoursDiff = Int(self.hour) - Int(secondObject.hour) - (minutesDiff < 0 ? 1 : 0)
        secondsDiff = (secondsDiff < 0 ? (60 + secondsDiff) : secondsDiff)
        minutesDiff = (minutesDiff < 0 ? (60 + minutesDiff) : minutesDiff)
        hoursDiff = (hoursDiff < 0 ? (24 + hoursDiff) : hoursDiff)
        
        let res = TimeDK(h: UInt(hoursDiff), m: UInt(minutesDiff), s: UInt(secondsDiff))
        return res!
    }
}

extension TimeDK {
    static func getSumFor2(firstObject: TimeDK, secondObject: TimeDK) -> TimeDK {
        return firstObject.getTimeSum(secondObject: secondObject)
    }
    
    static func getDiffFor2(firstObject: TimeDK, secondObject: TimeDK) -> TimeDK {
        return firstObject.getTimeDifference(secondObject: secondObject)
    }
}

print("\nЧастина 2")
var time = TimeDK(h: 12, m: 00, s: 04)
var time2 = TimeDK(h: 12, m: 10, s: 59)
var time3 = TimeDK(h: 21, m: 11, s: 25)

var time4 = TimeDK(h: 23, m: 59, s: 59)
var time5 = TimeDK(h: 12, m: 0, s: 1)
var time6 = TimeDK(h: 0, m: 0, s: 1)
    
var timeWithNoArgs = TimeDK()
var timeWithDate = TimeDK(date: Date())

print("Task 6")
print(time3!.getTime())
print(time!.getTimeSum(secondObject: timeWithNoArgs).get24Time())
print(time2!.getTimeDifference(secondObject: time3!).get24Time())

print("Task 7")
print(TimeDK.getSumFor2(firstObject: time!, secondObject: time2!).getTime())
print(TimeDK.getDiffFor2(firstObject: timeWithDate, secondObject: time2!).getTime())

print("Task 10")
print(time4!.getTimeSum(secondObject: time5!).get24Time())
print(timeWithNoArgs.getTimeDifference(secondObject: time6!).get24Time())
