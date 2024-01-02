//
//  TintColor.swift
//  Exponse Tracker
//
//  Created by Mauro de Oliveira André on 29/12/2023.
//

import SwiftUI

//: Custom tint colors for transaction

struct TintColor: Identifiable{
    let id: UUID = .init()
    var color: String
    var value: Color
}


var tints: [TintColor] = [
  
    TintColor(color: "Red", value: .red),
    TintColor(color: "Blue", value: .blue),
    TintColor(color: "Pink", value: .pink),
    TintColor(color: "Purple", value: .purple),
    TintColor(color: "Brown", value: .brown),
    TintColor(color: "Orange", value: .orange)

]
