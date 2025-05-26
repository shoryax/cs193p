import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🗽", "🗼", "🎆", "🎃", "🍣", "🍫", "🍡", "🍦"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            Text("Card Game")
                .font(.largeTitle)
                .foregroundColor(.orange)
            
            HStack {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(.orange)
            
            HStack {
                Button("Add Card") {
                    if cardCount < emojis.count {
                        cardCount += 1
                    }
                }
                .font(.title2)
                .padding()
                .disabled(cardCount >= emojis.count)
                
                Button("Remove Card") {
                    if cardCount > 0 {
                        cardCount -= 1
                    }
                }
                .font(.title2)
                .padding()
                .disabled(cardCount <= 0)
            }
        }
        .padding()
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
                base.fill(.orange)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
