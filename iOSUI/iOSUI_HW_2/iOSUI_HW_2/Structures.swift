//
//  Structures.swift
//  iOSUI_HW_2
//
//  Created by Philipp Lazarev on 12.05.2023.
//

import Foundation

public struct User {
    let id = UUID()
    var login: String
    var name: String
    
    init(login: String, name: String) {
        self.login = login
        self.name = name
    }
}

var billGates = User(login: "BillGates", name: "Bill Gates")
var joeBiden = User(login: "JoeBiden", name: "Joe Biden")
var katyPerry = User(login: "katyperry", name: "Katy Perry")
var timCook = User(login: "tim_cook", name: "Tim Cook")
var mkbhd = User(login: "MKBHD", name: "Marques Brownlee")
var lisaJackson = User(login: "lisapjackson", name: "Lisa P. Jackson")
var defaultUser = User(login: "default", name: "default")

public var users = [billGates, joeBiden, katyPerry, timCook, mkbhd, lisaJackson]

public struct Post {
    let id = UUID()
    var user: User
    var text: String
    
    init(user: User, text: String) {
        self.user = user
        self.text = text
    }
}

// Following posts are totally imaginary and do not represent any thoughts or quotes from mentioned users
public var posts = [
    Post(user: timCook, text: "Can't wait for some BIG announcements on WWDC 2023! See you June 5th!"),
    Post(user: katyPerry, text: "Got sum new music for y'all 👀"),
    Post(user: joeBiden, text: "I'm happy to announce that I will be running for the 2nd term as President of the United States!"),
    Post(user: timCook, text: "Logic Pro and Final Cut Pro are now available for millions of creators using iPad!"),
    Post(user: billGates, text: "Let's work together to make the world a better place."),
    Post(user: mkbhd, text: "The Google Pixel 7a is looking like a solid mid-range option for those who want a great camera and pure Android experience."),
    Post(user: joeBiden, text: "Addressing inflation is a top priority for my administration to ensure that hardworking Americans can afford the essentials they need to thrive."),
    Post(user: katyPerry, text: "Congratulations @edsheeran on your new album release, can't wait to listen to all the amazing songs!"),
    Post(user: billGates, text: "Although we're all relieved to hear the news from @WHO about the end of the Covid pandemic, we must continue to follow safety protocols and work towards ensuring equitable vaccine distribution to truly end this global crisis.")
]
