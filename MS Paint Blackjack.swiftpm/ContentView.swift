import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var inGame = true
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 25)
            
            VStack {
                // Dealer Cards
                HStack {
                    DealerView(dealer: game.dealer, inGame: $inGame)
                }
                .padding()
                
    //            // Card Deck Info
    //            HStack {
    //                CardDeckView(deck: game.deck)
    //            }
    //            .padding()
                
                Spacer()
                    .frame(height: 20)
                
                // Player Cards
                HStack {
                    PlayerView(player: game.player)
                }
                .padding()
            }
            
            // Game Victor Message
            HStack {
                GameMessageView(game: game, player: game.player, inGame: $inGame)
            }
            .padding()
            
            // Player Controls
            HStack {
                if(inGame) {
                    PlayerControlView(game: game, player: game.player, inGame: $inGame)
                } else {
                    Button(action: {
                        game = Game()
                        inGame.toggle()
                    }, label: {
                        VStack(spacing: 0) {
                            Image("restart")
                            Text("PLAY AGAIN")
                                .foregroundColor(.black)
                        }
                    })
                    
                }
            }
            Spacer()
            
        }
        .font(.custom("ChalkboardSE-Bold", size: 20))
        
    }
}
