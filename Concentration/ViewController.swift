//
//  ViewController.swift
//  Concentration
//
//  Created by Акраман Хайтукаев on 22.05.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        cardButtons.shuffle()
    }
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
          if let cardNumber = cardButtons.firstIndex(of: sender) {
              game.chooseCard(at: cardNumber)
              updateViewFromModel()
          } else {
            print("chose card was not in cardButtons")
        }
        
        func updateViewFromModel() {
           
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = game.cards[index]
                if card.isFaceUP {
                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = .white
                } else {
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ? .black : .orange
                }
            }
        }
        
    }
    var emojiChoices = ["⚽️","🚗","🎃","🦅","👻","🕸"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifire] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifire] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifire] ?? "?"
        
    }
}

