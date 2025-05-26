import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🗽", "🗼", "🎆", "🎃", "🍣", "🍫", "🍡", "🍦"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            Text("Card Game")
                .font(.largeTitle)
                .foregroundColor(.gray)
            
            LazyVGrid(columns: [GridItem(. adaptive (minimum: 120))]) {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(.teal)
            
            HStack {
                Button(action: {
                    if cardCount < emojis.count {
                        cardCount += 1
                    }
                }, label: {
                    Image(systemName: "rectangle.stack.badge.plus.fill")
                })
                .imageScale(. large)
                .font(.title2)
                .padding()
                .disabled(cardCount >= emojis.count)
                .foregroundColor(.mint)
                
                Button(action: {
                    if cardCount > 0 {
                        cardCount -= 1
                    }
                }, label: {
                    Image(systemName: "rectangle.stack.badge.minus.fill")
                })
                .imageScale(. large)
                .font(.title2)
                .padding()
                .disabled(cardCount <= 0)
                .foregroundColor(.mint)
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
                base.fill(.teal)
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
