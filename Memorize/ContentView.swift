import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            let emojis: Array<String> = ["🗽", "🗼", "🎆", "🎃", "a"]
            Text("Card Game ")
            HStack {
                ForEach(emojis.indices, id: \.self) { index in //(0..<4) in place of emojis.indices
                    CardView(content: emojis[index])
                }
            }
            .font(.largeTitle)
            .foregroundColor(.orange)
            .padding()
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
