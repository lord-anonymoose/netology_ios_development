/*Задание 1
 Придумайте именованные типы Swift, подбирая лучшие абстракции. Объявите свойства и методы в них. Статический анализатор подскажет, если вы забудете кое-что ('Type annotation missing...').
 */

// Пример, в котором уместно будет использовать enum - обработка состояния какого-либо процесса в приложении
enum Status {
    case triggered
    case started
    case processing
    case failed
    case finished
}

func getActivityStatus(status: Status) {
    switch status {
    case .triggered:
        print("The activity has been triggered")
    case .started:
        print("The activity has started")
    case .processing:
        print("The activity is in process")
    case .failed:
        print("The activity has failed")
    case .finished:
        print("The activity has been successfully finished")
    }
}

let myActivityStatus = Status.processing

getActivityStatus(status: myActivityStatus)



// Пример, в котором уместно будет использовать Stuct - Данные об исполнителе (музыканте) в Apple Music
enum Genre {
    case Pop
    case Rock
    case Country
    case Classical
}

struct Artist {
    var name: String
    var genres: [Genre]
    var albums: [Album]
}

struct Album {
    var name: String
    var artist: Artist
    var year: Int
    var genre: Genre
    var songs: [Song]
}

struct Song {
    var name: String
    var artist: Artist
    var album: Album
}



// Пример, когда уместно использовать class - персонаж в мобильной игре. У него есть как свойства, так и методы
enum Direction {
    case forward
    case backward
    case left
    case right
    
}

class Character {
    var name: String
    var type:String
    var level: Int
    var health: Int
    
    func move(direction: Direction) {
        print("The character has moved \(direction)")
    }
    
    func fight() -> Int {
        let damage = Int.random(in: 1...100)
        return damage
    }
    
    init(name: String, type: String, level: Int, health:Int) {
        self.name = name
        self.type = type
        self.level = level
        self.health = health
    }
}



/* Задание 2*
 Придумайте и напишите по два примера перечислений с raw values и assotiative values.
 */

// Пример 1 associated values (Медиа):
enum Media {
    case photo(id: String, ext: FileExtension, isLive: Bool, isHDR: Bool, isPortrait: Bool, location: String)
    case video(id: String, ext: FileExtension, isHDR: Bool, resolution: Int, location: String)
    case audio(id: String, ext: FileExtension)
}

// Это вспомогательное:
enum FileExtension {
    case mp3
    case mp4
    case jpeg
    case png
    case heic
    case mov
}


// Пример 2 associated values (ремешки для часов):
enum Band {
    case sport(color: String)
    case soloLoop(color: String, size: Int)
    case braidedSoloLoop(color: String, size: Int)
    case milaneseLoop(color: String)
    case modernBuckle(color: String)
}


// Пример 1 raw values (Дни недели и их номера):
enum Day: Int {
    case Monday = 1
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}


// Пример 2 raw values (Планеты солнечной системы по удаленности от солнца):
enum Planet: Int {
    case venus = 1
    case mercury
    case earth
    case mars
    case jupiter
    case saturn
    case neptune
    case pluto
}


