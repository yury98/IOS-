//
//  main.swift
//  DZ1
//
//  Created by Юрий Шашкин on 16.09.2018.
//  Copyright © 2018 Юрий Шашкин. All rights reserved.
//

import Foundation

enum Currency: String {
    case RUR = "RUR"
    case USD = "USD"
    case EUD = "EUD"
}

protocol PrintProtocol {
    func printInfo()
}

class Account : PrintProtocol {
    var id: Int
    var balance: Double
    var currency: Currency?
    var description: String
    var offer: String?
    
    init(id: Int, balance: Double, currency: String, description: String, offer: String? = "default offer") {
        self.id = id
        self.balance = balance
        self.currency = Currency(rawValue: currency)
        self.description = description
        self.offer = offer
    }
    
    func printInfo() {
        print("Account: \nid: \(id) \nbalance: \(balance) \ncurrency: \(currency?.rawValue ?? "no currency") \ndescription: \(description) \noffer: \(offer ?? "no offer")")
    }
}
//var ac1 = Account(id: 1, balance: 265.373, currency: "USD", description: "good dexcription", offer: "good offer")
//var ac2 = Account(id: 10, balance: 26553.373, currency: "RUR", description: "good dexcription")
//ac1.printInfo()
//ac2.printInfo()

func ForDate(StringDate: String) -> Date? {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd"
    return dateFormatterGet.date(from: StringDate)
}

class ReissueInfo : PrintProtocol {
    var date: Date?
    var info: String
    var address: String
    
    init(sdate: String, info: String, address: String = "Головной офис"){
        self.date = ForDate(StringDate: sdate)
        self.info = info
        self.address = address
    }
    
    func printInfo() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd --- MM --- yyyy"
        let datee = dateFormatter.string(from: date! )
        print("Reissue Info \ndate: \(datee) \ninfo: \(info) \naddress: \(address)")
    }
}
//var rei = ReissueInfo(sdate: "2018-09-16",info: "info", address: "address")
//rei.printInfo()

class Card: PrintProtocol {
    var id: Int
    var balance: Double
    var currency: Currency?
    var reissueInfo: ReissueInfo?
    
    init(id: Int, balance: Double, currency: String, reissueInfo: ReissueInfo? = nil ){
        self.id = id
        self.balance = balance
        self.currency = Currency(rawValue: currency)
        self.reissueInfo = reissueInfo
    }
    
    func printInfo() {
        print("Card \ncard id: \(id) \nbalance: \(balance) \ncurrency: \(currency?.rawValue ?? "no currency") \n\( reissueInfo?.address ?? "no reissure")")
    }
}
//var car = Card(id: 1, balance: 23455678.45, currency: "RUR", reissueInfo: rei)
//car.printInfo()

class ServerResponce: PrintProtocol {
    var cards: [Card]
    var accounts: [Account]
    
    init(cardArray: [Card], accountArray: [Account]) {
        self.cards = cardArray
        self.accounts = accountArray
    }
    func printInfo() {
        print("Server Response \ncards: \(cards) \naccounts: \(accounts)")
    }
}

var ac1 = Account(id: 1, balance: 265.373, currency: "USD", description: "good dexcription1", offer: "good offer")
var ac2 = Account(id: 10, balance: 26553.373, currency: "RUR", description: "good dexcription2")

let accs = [ac1, ac2]

let reissueInfo = ReissueInfo(sdate: "2018-09-16",info: "info", address: "address")
let card1 = Card(id: 2, balance:1.04, currency: "EUD", reissueInfo: reissueInfo)

let card2 = Card(id: 12, balance:68723.04, currency: "RUR")

let cards = [card1, card2]

let response = ServerResponce(cardArray: cards, accountArray: accs)

var array = [PrintProtocol]()

array.append(contentsOf: cards)

array.append(contentsOf: accs)

array.append(response)

for i in array {
    i.printInfo()
    
}

