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

public var users = [billGates, joeBiden, katyPerry, timCook, mkbhd, lisaJackson]
//public var users = [User]()
