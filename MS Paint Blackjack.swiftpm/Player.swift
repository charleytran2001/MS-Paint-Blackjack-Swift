//
//  Player.swift
//  MS Paint Blackjack
//
//  Created by Charley Tran on 2/9/24.
//

import Foundation

class Player: ObservableObject  {
    var deck: Deck
    
    init(deck: Deck) {
        self.deck = deck
    }
    
    @Published var cards: [Card] = []
    @Published var total = 0
    var aceCheck = false
    var hardHand = false
    
    func hit() {
        if(total < 21 && deck.totalCards != 0) {
            let card = deck.drawCard()
            cards.append(card)
            
            if(card.face == "A") {
                // If first Ace, add 11 to total. Otherwise add 1.
                if(aceCheck == false) {
                    aceCheck = true
                    total += 11
                } else {
                    total += 1
                }
            } else if(card.face == "J" || card.face == "Q" || card.face == "K") {
                total += 10
            } else {
                total += Int(card.face)!
            }
            
            // If total goes over 21 and player has Ace, remove 10. Can only occur once.
            if(total > 21 && aceCheck == true && hardHand == false) {
                hardHand = true
                total -= 10
            }
            
            deck.removeLastCard()
        }
    }
}
