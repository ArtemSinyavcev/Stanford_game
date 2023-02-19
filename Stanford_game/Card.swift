//
//  Card.swift
//  Stanford_game
//
//  Created by Артём Синявцев on 19.02.2023.
//

// MARK: -

import Foundation


struct Card {
    
    var cardUp = false
    var cardSovpala = false
    var identifier: Int
    
    static var identifierNumber = 0
    
    static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
        
    }
    
    init() {
        
        self.identifier = Card.identifierGenerator()
        
    }
    
}
