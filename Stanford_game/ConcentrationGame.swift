//
//  ConcentrationGame.swift
//  Stanford_game
//
//  Created by Артём Синявцев on 19.02.2023.
//

//   MARK: -    МОДЕЛЬ

import Foundation

class ConcentrationGame {
    
    var cards = [Card]()
    
    var indexOdnoyPerevernutoiCart: Int?
    
    // Функция логики игры
    
    func viborCard (at index: Int) {
        if !cards[index].cardSovpala {
            if let sovpalIndex = indexOdnoyPerevernutoiCart, sovpalIndex != index {
                if cards[sovpalIndex].identifier == cards[index].identifier {
                    cards[sovpalIndex].cardSovpala = true
                    cards[index].cardSovpala = true
                }
                cards[index].cardUp = true
                indexOdnoyPerevernutoiCart = nil
                
            } else  {
                for flipDown in cards.indices {
                    cards[flipDown].cardUp = false
                }
                cards[index].cardUp = true
                indexOdnoyPerevernutoiCart = index
            }
        }
        
    }
    
    init(numberOfPairedCards: Int) {
        for _ in 1...numberOfPairedCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
            cards = cards.shuffled()
            
            
        }
        
    }
    
}


