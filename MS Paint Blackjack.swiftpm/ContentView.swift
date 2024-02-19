import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var inGame = true
    
    var body: some View {
        VStack {
            
            // Dealer Cards
            HStack {
                DealerView(dealer: game.dealer, inGame: $inGame)
            }
            
            // Card Deck Info
            HStack {
                CardDeckView(deck: game.deck)
            }
            .padding()
            
            // Game Victor Message
            if(!inGame) {
                Text(game.gameVictor)
            }
            
            // Player Cards
            HStack {
                PlayerView(player: game.player)
            }
            .padding()
            
            // Player Controls
            HStack {
                if(inGame) {
                    PlayerControlView(game: game, player: game.player, inGame: $inGame)
                } else {
                    Button("Play Again", action: {
                        game = Game()
                        inGame.toggle()
                    })
                }
                
            }
            
        }
    }
}
