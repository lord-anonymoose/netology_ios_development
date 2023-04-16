/*
 Задача 1

 Вы разрабатываете библиотеку аудиотреков. Вам необходимо реализовать одну из категорий музыки, наполненную треками.

 Алгоритм выполнения

 Создайте объект Трек.
 Определите в нём свойства: имя, исполнитель, длительность и страна. Подумайте, где можно использовать enum.
 Создайте класс Категория. НАЗВАЛ ПЛЕЙЛИСТОМ
 Объявите в нём свойства: название категории, список треков и количество треков в списке (экспериментируйте с «ленивыми» и вычисляемыми свойствами).
 Определите методы добавления и удаления треков в эту категорию.
 */

import Foundation

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

// Про протокол Equatable подглядел на портале HackingWithSwift Пола Хадсона. Нужен для того, чтобы осуществлять поиск песни по массиву в плейлисте (хотя, можно было бы и попробовать реализовать через Set)
struct Artist: Equatable {
    var name: String
    var country: Country
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

class Playlist: Equatable {
    var name: String
    lazy var description = String()
    var songs: [Song]
    var count: Int {
        get {
            songs.count
        }
    }
    
    init(name: String, songs: [Song]) {
        self.name = name
        self.songs = songs
    }
    
    static func ==(lhs: Playlist, rhs: Playlist) -> Bool {
        return lhs.name == rhs.name
    }
    
    func addSong(_ song: Song) {
        if self.songs.contains(song) {
            print("\(song.name) is already in \(self.name) playlist")
        } else {
            self.songs.append(song)
            print("\(song.name) has been added to \(self.name) playlist")
        }
    }
    
    func removeSong(_ song: Song) {
        if self.songs.contains(song) {
            self.songs = self.songs.filter { $0 != song }
            print("\(song.name) has been deleted from \(self.name) playlist")
        } else {
            print("\(song.name) is not yet in \(self.name) playlist")
        }
    }
    
    func exchangeSongs(with playlist: Playlist) {
        let temp = self.songs
        self.songs = playlist.songs
        playlist.songs = temp
    }

}

let edSheeran = Artist(name: "Ed Sheeran", country: .uk)

let shapeOfYou = Song(name: "Shape of You", artist: edSheeran, lengthSeconds: 234, genre: .pop, year: 2017)
let galwayGirl = Song(name: "Galway Girl", artist: edSheeran, lengthSeconds: 170, genre: .pop, year: 2017)
let perfect = Song(name: "Perfect", artist: edSheeran, lengthSeconds: 263, genre: .pop, year: 2017)
let happier = Song(name: "Happier", artist: edSheeran, lengthSeconds: 208, genre: .pop, year: 2017)
let newMan = Song(name: "New Man", artist: edSheeran, lengthSeconds: 189, genre: .pop, year: 2017)

let divide = Playlist(name: "÷", songs: [shapeOfYou, galwayGirl, perfect, happier])

divide.addSong(newMan)

divide.removeSong(happier)



/*
Задача 2
Доработайте свою библиотеку так, чтобы в ней было несколько категорий.
Алгоритм выполнения
Создайте класс библиотеки. Этот класс будет аналогичен классу категории, только хранить он должен список категорий.
*/
struct User {
    var name: String
    var appleID: String
    let uuid = UUID().uuidString
}

class Library {
    var owner: User
    lazy var description = String()
    var playlists: [Playlist]
    var count: Int {
        get {
            playlists.count
        }
    }
    
    init(owner: User, playlists: [Playlist]) {
        self.playlists = playlists
        self.owner = owner
    }
    
    func addPlaylist(_ playlist: Playlist) {
        if self.playlists.contains(playlist) {
            print("\(playlist.name) is already in \(self.owner.name)'s library")
        } else {
            self.playlists.append(playlist)
            print("\(playlist.name) has been added to \(self.owner.name)'s library")
        }
    }
    
    func removePlaylist(_ playlist: Playlist) {
        if self.playlists.contains(playlist) {
            self.playlists = self.playlists.filter { $0 != playlist }
            print("\(playlist.name) has been deleted from \(self.owner.name)'s library")
        } else {
            print("\(playlist.name) is not yet in \(self.owner.name)'s library")
        }
    }
}

let user = User(name: "Philipp", appleID: "phil.appleseed@apple.com")

let badHabits = Song(name: "Bad Habits", artist: edSheeran, lengthSeconds: 231, genre: .pop, year: 2021)
let twoStep = Song(name: "2step", artist: edSheeran, lengthSeconds: 154, genre: .pop, year: 2021)
let shivers = Song(name: "Shivers", artist: edSheeran, lengthSeconds: 208, genre: .pop, year: 2021)
let visitingHours = Song(name: "Visiting Hours", artist: edSheeran, lengthSeconds: 216, genre: .pop, year: 2021)
let overpassGraff = Song(name: "Overpass Graffity", artist: edSheeran, lengthSeconds: 237, genre: .pop, year: 2021)

let equal = Playlist(name: "=", songs: [badHabits, twoStep, shivers, visitingHours, overpassGraff])

let myLibrary = Library(owner: user, playlists: [equal, divide])

myLibrary.removePlaylist(divide)

myLibrary.addPlaylist(divide)



/*
 Задача 3* (задача со звёздочкой)
 Преобразуйте классы так, чтобы в пределах вашей библиотеки можно было обмениваться треками между категориями.
 */
divide.exchangeSongs(with: equal)

print(divide.songs[0].name)
print(equal.songs[0].name)

