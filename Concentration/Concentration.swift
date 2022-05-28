//
//  Concentration.swift
//  Concentration
//
//  Created by Акраман Хайтукаев on 28.05.2022.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Проверить совпадают ли карты
                if cards[matchIndex].identifire == cards[index].identifire {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUP = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // Либо нет карт, либо две карты лежат лицом вверх
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUP = false
                }
                cards[index].isFaceUP = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
            
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
    }
}
