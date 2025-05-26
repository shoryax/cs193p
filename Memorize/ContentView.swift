import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Guess A Card")
            HStack {
                let emojis: Array<String> = ["🗽", "🗼", "🎆", "🎃"]
                CardView(content: emojis[0], isFaceUp: true)
                CardView(content: emojis[1])
                CardView(content: emojis[2], isFaceUp: false)
                CardView(content: emojis[3], isFaceUp: false)
            }
            .font(.largeTitle)
            .foregroundColor(.orange)
            .padding()
        }
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                Text(content) .font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
//            isFaceUp = !isFaceUp can be this but that thing is suitable for boolean types
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
