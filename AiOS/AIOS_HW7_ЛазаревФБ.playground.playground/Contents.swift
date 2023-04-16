/*
 Задача 1

 Вы продолжаете разрабатывать библиотеку аудиотреков. Сейчас вам предстоит работать над исполнителями треков.

 Алгоритм выполнения

 Создайте суперкласс Артист.
 Определите в нём общие для артиста свойства: имя, страна, жанр.
 Определите общие методы — напишите трек и исполните его.
 В реализацию метода «Написать трек» добавьте вывод в консоль «Я (имя артиста) написал трек (название трека)».
 В реализацию метода «Исполнить трек» добавьте вывод в консоль «Я (имя артиста) исполнил трек (название трека)».
 Создайте три сабкласса любых артистов и переопределите в них методы суперкласса класса.
 */

// Сначала немного Legacy кода

typealias Seconds = Int
typealias SongLength = String

enum Country: String {
    case usa = "the USA"
    case uk = "the UK"
    case germany = "Germany"
    case spain = "Spain"
}

enum Genre: String {
    case pop = "Pop"
    case rock = "Rock"
    case poprock = "Pop-Rock"
    case classical = "Classical"
}

class Song: Equatable {
    var name: String
    var artist: Artist
    var lengthSeconds: Seconds
    var length: SongLength {
        get {
            return ("\((lengthSeconds - (lengthSeconds % 60)) / 60) minutes \(lengthSeconds % 60) seconds")
        }
    }
    var genre: Genre
    var year: Int
    
    init(name: String, artist: Artist, lengthSeconds: Seconds, genre: Genre, year: Int) {
        self.name = name
        self.artist = artist
        self.lengthSeconds = lengthSeconds
        self.genre = genre
        self.year = year
    }
    
    static func ==(lhs: Song, rhs: Song) -> Bool {
        return lhs.name == rhs.name && lhs.artist.name == rhs.artist.name && lhs.lengthSeconds == rhs.lengthSeconds
    }
}

//full-stack артист
class Artist {
    var name: String
    var country: Country
    var genre: Genre
    
    init (name: String, country: Country, genre: Genre) {
        self.name = name
        self.country = country
        self.genre = genre
    }
    
    func makeSong (_ song: Song) {
        print("I'm \(self.name) and I made a song called '\(song.name)")
    }
    
    func performSong (_ song: Song) {
        print("I'm \(self.name) and I perfomed a song called '\(song.name)")
    }
}

enum Language: String {
    case eng = "English"
    case rus = "Russian"
    case ua = "Ukrainian"
    case de = "German"
    case esp = "Spanish"
}

// Писатель - пишет стихи, но не поет и не играет на инструментах
final class Writer: Artist {
    var language: Language
    
    init(name: String, country: Country, genre: Genre, language: Language) {
        self.language = language
        super.init(name: name, country: country, genre: genre)
    }
    
    override func makeSong(_ song: Song) {
        print("I'm \(self.name) and I wrote a song called '\(song.name)")
    }
    
    override func performSong(_ song: Song) {
        print("Ooops! Seems like I can't either play or sing!")
    }
    
    func rhyme() {
        print("Look what I found on rhymezone.com")
    }
}

enum Instrument: String {
    case guitar = "guitar"
    case piano = "piano"
    case drums = "drums"
    case flute = "flute"
    case fiddle = "fiddle"
}

// Музыкант - не поет и не пишет, но отменно играет на инструментах
final class Musician: Artist {
    var instrument: Instrument
    
    init(name: String, country: Country, genre: Genre, instrument: Instrument) {
        self.instrument = instrument
        super.init(name: name, country: country, genre: genre)
    }
    
    override func makeSong(_ song: Song) {
        print("I can't write songs, unfortunately!")
    }
    
    override func performSong(_ song: Song) {
        print("I played the music for \(song.name) with my \(self.instrument)!")
    }
    
    func train() {
        print("I prepared for my concert.")
    }
}

enum Voice: String {
    case bass = "bass"
    case baritone = "baritone"
    case tenor = "tenor"
    case msoprano = "mezzo-soprano"
    case countertenor = "countertenor"
    case soprano = "soprano"
}

// Певец - не пишет и не играет, но отменно поет
final class Singer: Artist {
    var voice: Voice
    
    init (name: String, country: Country, genre: Genre, voice: Voice) {
        self.voice = voice
        super.init(name: name, country: country, genre: genre)
    }
    
    override func makeSong(_ song: Song) {
        print("I don't write songs")
    }
}



/*
 Задача 2

Создание списка артистов.

Алгоритм выполнения

Доработайте существующие классы артистов так, чтобы они имели уникальные для каждого из них свойства и методы. 
Защитите эти классы артистов от редактирования в будущем.
 
Добавил свойства и методы, сделал подклассы финальными
*/

let mccartney = Writer(name: "Paul McCartney", country: .uk, genre: .rock, language: .eng)

let lennon = Singer(name: "John Lennon", country: .uk, genre: .rock, voice: .baritone)

let harrison = Musician(name: "George Harrison", country: .uk, genre: .rock, instrument: .guitar)

let starr = Musician(name: "Ringo Starr", country: .uk, genre: .rock, instrument: .drums)


/*
 Задача 3* (задача со звёздочкой)

 Создайте пустой массив, чтобы потом добавить в него ваших артистов.
 Добавьте в массив созданных ранее артистов.
 Напишите отчёт о том, что вы поняли и в чём разобрались, выполняя это задание.
 Дайте оценку своему пониманию этой темы.
 Это задание поможет вам лучше понять изучаемую тему. При написании отчёта вы выявите слабые и сильные места в изучении темы, закроете пробелы или найдёте новые вопросы.

 При возникновении вопросов можете писать в чат группы либо преподавателю в личные сообщения в чате учебной группы.
 */

var beatles = [Artist]()

beatles.append(mccartney)
beatles.append(lennon)
beatles.append(harrison)
beatles.append(starr)

for beatle in beatles {
    print(beatle.name)
}

/*
 Как мы выяснили, несмотря на строю типизацию и возможность хранить в массиве данные только одного класса, в одном массиве могут храниться данные разных подтипов одного общего типа.
 Я научился создавать и использовать наследование классов в языке Swift, что позволяет создавать более гибкие и мощные приложения. Я понял, как переопределять функции и добавлять уникальные свойства подклассам, а также как использовать полиморфизм и ключевое слово "super". Я усвоил, что необходимо правильно использовать наследование и защищать свои классы от нежелательных изменений в будущем.
 */
