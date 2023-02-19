//
//  ViewController.swift
//  Stanford_game
//
//  Created by Артём Синявцев on 19.02.2023.
//

//   MARK: -    КОНТРОЛЛЕР

import UIKit

class ViewController: UIViewController {
    
    
    lazy var game = ConcentrationGame(numberOfPairedCards: (bottunCollection.count + 1) / 2)
    
    var touches = 0 {
        // наблюдатель didSet
        didSet {
            touchLabel.text = "Кол-во нажатия:  \(touches)"
        }
    }
    
    var emojiCollection = ["🍗","🍅","🥑","🍇","🍏","🍋","🍒","🥚","🍞","🍟","🍌","🍬"]
    
    var emojiDictionary = [Int: String]()
    
    
    func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomIndex)
            
        }
        
        return emojiDictionary[card.identifier] ?? "?? почему, наверно потому что Словарь"
        
    }
    
    
    func updateViewFromModel() {
        
        for index in bottunCollection.indices {
            let button = bottunCollection[index]
            let card = game.cards[index]
            if card.cardUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = .white
                if card.cardSovpala {
                    button.isHidden = true
                }
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.cardSovpala ? UIColor.clear : UIColor.black
                
            }
        }
    }
    
    @IBOutlet var bottunCollection: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = bottunCollection.firstIndex(of: sender) {
            game.viborCard(at: buttonIndex)
            
            updateViewFromModel()
            
        }
    }
    
}
