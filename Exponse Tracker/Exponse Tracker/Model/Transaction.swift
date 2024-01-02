//
//  Transaction.swift
//  Exponse Tracker
//
//  Created by Mauro de Oliveira André on 29/12/2023.
//

import SwiftUI

struct Transaction: Identifiable {
  
    let id : UUID = .init()
    var title: String
    var remarks: String
    var amount: Double
    var dateAdded: Date
    var category: String
    var tintColor: String
    
    init(title: String, remarks: String, amount: Double, dateAdded: Date, category: Category, tintColor: TintColor) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dateAdded
        self.category = category.rawValue
        self.tintColor = tintColor.color
    }
    
    //: Extrating color value from tintColor String
    
    var color: Color{
        return tints.first(where: {$0.color == tintColor})?.value ?? appTint
    }
    
}


//: Sample transaction

var sampleTransaction: [Transaction] = [

    .init(title: "Magic Keyboard", remarks: "Apple Product", amount: 240, dateAdded: .now, category: .exponse, tintColor: tints.randomElement()!),
    .init(title: "Apple music", remarks: "Subscription", amount: 100, dateAdded: .now, category: .exponse, tintColor: tints.randomElement()!),
    .init(title: "iCloud+", remarks: "Subscription", amount: 88.0, dateAdded: .now, category: .exponse, tintColor: tints.randomElement()!),
    .init(title: "Payment", remarks: "Payment Received!", amount: 300, dateAdded: .now, category: .income, tintColor: tints.randomElement()!),
    .init(title: "MacBook pro M3", remarks: "Apple Product", amount: 3000, dateAdded: .now, category: .income, tintColor: tints.randomElement()!),

]
