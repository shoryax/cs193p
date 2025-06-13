//
//  memorizeGame.swift
//  Memorize
//
//  Created by Shorya Vardhan on 5/29/25.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        //add numberOfPairsOfCards x 2
        for pairIndex in 0..<max(2, numberOfPairsOfCards)  { // _ not used anywhere further in the code
            let content = cardContentFactory(pairIndex)
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: "\(pairIndex+1)b"))
        }
    }
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 // FIXME:  bogus!!
    }
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
        var id: String
        
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down"), \(isMatched ? "matched" : "")"
        }
    }
}
