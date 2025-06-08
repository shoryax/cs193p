//
//  memorizeGame.swift
//  Memorize
//
//  Created by Shorya Vardhan on 5/29/25.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int) {
        //cards = Array<Card>()
        cards = []
    }
    func choose(card: Card) {
         
    }
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
    }
}
