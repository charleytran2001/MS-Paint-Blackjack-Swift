import SwiftUI

struct ContentView: View {
    let deck = Deck(numOfDecks: 1)
    @State var playerCards = ""
    @State var playerTotal = 0
    @State var playerAceCheck = false
    @State var playerHardHand = false
    
    @State var dealerCards = ""
    @State var dealerTotal = 0
    @State var dealerAceCheck = false
    @State var dealerHardHand = false
    
    var body: some View {
        VStack {
            
            HStack {
                VStack {
                    Text("Dealer: \(dealerTotal)")
                    Text(dealerCards)
                }
            }
            
            HStack {
                Text("Cards Left: \(deck.totalCards)")
                Text("Cards Drawn: \(deck.drawnCards)")
            }
            
            HStack {
                VStack {
                    Text("Player: \(playerTotal)")
                    Text(playerCards)
                }
            }
            
            Button("Hit", action: {
                if(playerTotal < 21 && deck.totalCards != 0) {
                    let card = deck.drawCard()
                    playerCards.append("\(card.suit)\(card.face) ")
                    
                    if(card.face == "A") {
                        // If first Ace, add 11 to total. Otherwise add 1.
                        if(playerAceCheck == false) {
                            playerAceCheck = true
                            playerTotal += 11
                        } else {
                            playerTotal += 1
                        }
                    } else if(card.face == "J" || card.face == "Q" || card.face == "K") {
                        playerTotal += 10
                    } else {
                        playerTotal += Int(card.face)!
                    }
                    
                    // If total goes over 21 and player has Ace, remove 10. Can only occur once.
                    if(playerTotal > 21 && playerAceCheck == true && playerHardHand == false) {
                        playerHardHand = true
                        playerTotal -= 10
                    }
                    
                    deck.removeLastCard()
                }
            })
            
        }
    }
}
