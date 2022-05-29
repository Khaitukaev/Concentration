//
//  Card.swift
//  Concentration
//
//  Created by Акраман Хайтукаев on 28.05.2022.
//

import Foundation

struct Card {
    var isFaceUP = false
    var isMatched = false
    var identifire: Int
    
    static var identifireFactory = 0
    
    static func getUniqueIdentifire() -> Int {
        Card.identifireFactory += 1
        return Card.identifireFactory
    }
    
    init() {
        self.identifire = Card.getUniqueIdentifire()
    }
}
