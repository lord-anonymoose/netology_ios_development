/*
 Задача 1

 Представьте себя инженером-проектировщиком телевизоров во времена, когда эпоха телевещания только набирала обороты.

 Вам поступила задача — создать устройство для просмотра эфира в домашних условиях «Телевизор в каждую семью».

 Нужно реализовать перечисление (enum) «Телевизионный канал» с 5–7 каналами.

 Алгоритм выполнения

 Реализуйте класс «Телевизор». У него должны быть состояния:
 фирма/модель — реализовать одним полем. Подумайте, какой тип данных подойдёт;
 включён/выключен;
 текущий телеканал.
 У него должно быть поведение:

 показать, что сейчас идёт по телевизору.
 Вызовите метод и покажите, что сейчас идёт по телевизору.
 Сделайте изменение состояний телевизора на свой выбор.
 Повторите вызов метода и покажите, что сейчас идёт по телевизору.
 */
enum Channel: String {
    case ng = "National Geographic"
    case dw = "Deutsche Welle"
    case tvrain = "Дождь"
    case bbc = "BBC"
    case eurosport = "Eurosport"
    case euronews = "Euronews"
}

class Television {
    var model: (String, String)
    var isOn: Bool
    var currChannel: Channel?
    
    init (model: (String, String), isOn: Bool, currChannel: Channel?) {
        self.model = model
        self.isOn = isOn
        self.currChannel = currChannel
    }
    
    func showChannel() {
        if self.currChannel != nil && self.isOn == true {
            print("The channel shown on TV is \(self.currChannel!.rawValue)")
        } else if self.isOn == false {
            print("TV is off")
        } else {
            print("TV is on yet not showing anything")
        }
    }
    
    func setChannel(channel: Channel) {
        self.currChannel = channel
    }
}

var myTV = Television(model: ("Panasonic", "A-Series"), isOn: true, currChannel: nil)

myTV.showChannel()
print("")

myTV.setChannel(channel: .bbc)

myTV.showChannel()
print("")


/*
 Задача 2

 Время идёт, рынок и потребители развиваются, и ваша компания набирает обоороты. Поступают всё новые требования к эволюции устройств. Перед вами снова инженерная задача — обеспечить пользователей практичным устройством.

 Алгоритм выполнения

 Создайте новый класс «Телевизор» с другим названием класса, который будет уметь всё, что и предыдущий.

 Реализуйте структуру настроек (struct):

 громкость от 0 до 10 — то есть могут быть промежуточные значения. Подумайте, какой тип использовать;
 показывать цветом или чёрно-белым. Подумайте, какой тип данных лучше всего использовать.
 Интегрируйте Настройки в новый класс «Телевизор».

 Переопределите метод «Что сейчас идёт по телевизору» из класса родителя. Вызовите метод и покажите, что сейчас идёт по телевизору, учитывая настройки.
 */
struct Settings {
    var isColored: Bool = true
    var vollume: Int = 5 {
        didSet {
            if vollume < 0 { vollume = 0 }
            else if vollume > 10 { vollume = 10 }
        }
    }
    
    func showColor() {
        switch self.isColored {
            case true: print("The picture is colored")
            case false: print("The picture is not colored")
        }
    }
    
    func showVollume() {
        print ("Current vollume is \(self.vollume)")
    }
}

class Television2G: Television {
    var settings: Settings
    
    init(model: (String, String), isOn: Bool, currChannel: Channel?, settings: Settings) {
        self.settings = settings
        super.init (model: model, isOn: isOn, currChannel: currChannel)
    }
    
    override func showChannel() {
        if self.currChannel != nil && self.isOn == true {
            print("The channel shown on TV is \(self.currChannel!.rawValue)")
        } else if self.isOn == false {
            print("TV is off")
        } else {
            print("TV is on yet not showing anything")
        }
    }
    
    func addVolume() {
        self.settings.vollume += 1
        self.settings.showVollume()
    }
    
    func extractVollume() {
        self.settings.vollume += -1
        self.settings.showVollume()
    }
    
    func switchColored() {
        self.settings.isColored.toggle()
        self.settings.showColor()
    }
}

let settings = Settings(isColored: true, vollume: 5)

let newTV = Television2G(model: ("Panasonic", "Series C"), isOn: true, currChannel: .eurosport, settings: settings)

newTV.showChannel()
print("")

newTV.addVolume()
print("")

newTV.extractVollume()
print("")

newTV.switchColored()



/*
 Задача 3* (задача со звёздочкой)
 
Порог новой эры пройден. Теперь есть не только радиоволна, но и видеомагнитофоны. Эту технику подключают проводами к телевизору и смотрят в записи свои любимые фильмы. Вам, как ведущему инженеру, срочно нужно адаптировать продукт вашей компании, так как спрос на устаревший вариант резко пошёл вниз.

Алгоритм выполнения

Создайте перечисление со связанными значениями с двумя кейсами: телеканал и подключение по входящему видео порту.
Интегрируйте эту опцию в «Телевизор».
Вызовите метод и покажите, что сейчас идёт по телевизору.
*/
enum Input: String {
    case tv_channels = "TV Channels"
    case dvd = "dvd"
}

class Television3G: Television2G {
    var input: Input {
        didSet {
            if self.input == .dvd {
                self.currChannel = nil
            }
        }
    }
    
    init(model: (String, String), isOn: Bool, currChannel: Channel?, settings: Settings, input: Input) {
        self.input = input
        super.init(model: model, isOn: isOn, currChannel: currChannel, settings: settings)
    }
    
    override func showChannel() {
        if self.isOn == false {
            print("TV is off")
        } else if self.input == .dvd {
            print("TV is showing media from DVD drive")
        } else if self.currChannel == nil {
            print("TV is on yet not showing anything")
        } else if self.currChannel != nil {
            print("TV is currently showing \(currChannel!.rawValue)")
        }
    }
    
    func showInput() {
        print("Current input method: \(self.input.rawValue)")
    }
    
    func switchInput() {
        if self.input == .dvd {
            self.input = .tv_channels
        } else {
            self.input = .dvd
        }
        showInput()
    }
}

let newerTV = Television3G(model: ("Samsung", "GWTX300"), isOn: true, currChannel: .eurosport, settings: settings, input: .dvd)

newerTV.showChannel()
print(""
)
newerTV.switchInput()

