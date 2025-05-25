import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("⭐️ Guess The Card ⭐️")
        }
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView()
            CardView()
        }
        .font(.largeTitle) //does for all
        .foregroundColor(.orange)
        .padding()
    }
}
struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        if (isFaceUp) {
            ZStack(content: {
                RoundedRectangle (cornerRadius: 20)
                    .foregroundColor (.black)
                RoundedRectangle (cornerRadius: 20)
                    .strokeBorder(lineWidth: 2)
                Text ("⭐️") .font(.largeTitle)
            })
        }
        else {
            RoundedRectangle (cornerRadius: 20)
                .foregroundColor (.orange)
        }
    }
}

#Preview {
    ContentView()
}
