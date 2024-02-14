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
            
            // Player Cards
            HStack {
                PlayerView(player: game.player)
            }
            .padding()
            
            // Player Controls
            HStack {
                if(inGame) {
                    Button("Hit", action: {
                        game.player.hit()
                    })
                    
                    Button("Stand", action: {
                        game.stand()
                        inGame.toggle()
                    })
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
