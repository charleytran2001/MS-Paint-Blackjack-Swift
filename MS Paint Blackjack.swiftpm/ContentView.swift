import SwiftUI

struct ContentView: View {
    var game = Game()
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Dealer: ")
            }
            
            HStack {
                CardDeckView(deck: game.deck)
            }
            
            HStack {
                PlayerView(player: game.player)
            }
            
            Button("Hit", action: {
                game.player.hit()
            })
            
        }
    }
}
