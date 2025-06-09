//
//  Created by Shorya Vardhan on 5/29/25.
//  This is view model

import SwiftUI

class EmojiMemoryGame {
    private static let emojis = ["🗽", "🗼", "🎆", "🎃", "🍣", "🍫", "🍡", "🍦", "🫧", "🥪", "🫑", "🌭", "🌯", "🥬", "🧊"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in // can use that $0 thing here
            if (emojis.indices.contains(pairIndex)) {
                return emojis[pairIndex]
            }
            else {
                return "⁉️"
            }
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
} 
