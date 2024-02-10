import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var inGame = true
    
    var body: some View {
        VStack {
            
            HStack {
                DealerView(dealer: game.dealer)
            }
            
            HStack {
                CardDeckView(deck: game.deck)
            }
            
            HStack {
                PlayerView(player: game.player)
            }
            
            HStack {
                Button("Hit", action: {
                    game.player.hit()
                })
                .disabled(!inGame)
                
                Button("Stand", action: {
                    game.stand()
                    inGame.toggle()
                })
                .disabled(!inGame)
                
                Button("Refresh", action: {
                    game = Game()
                    inGame.toggle()
                })
                .disabled(inGame)
            }
            
        }
    }
}
