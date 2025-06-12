//
//
//

import SwiftUI

struct EmojiMemoryGameView: View {
    let emojis: [String] = ["🗽", "🗼", "🎆", "🎃", "🍣", "🍫", "🍡", "🍦", "🫧", "🥪", "🫑", "🌭", "🌯", "🥬", "🧊"]
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Card Game")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                
                LazyVGrid(columns: [GridItem(. adaptive (minimum: 120))]) {
                    ForEach(emojis.indices, id: \.self) { index in
                        CardView(content: emojis[index])
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
        }
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            } else {
                base.fill(.teal)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    EmojiMemoryGameView()
}
