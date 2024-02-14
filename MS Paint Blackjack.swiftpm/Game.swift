//
//  Game.swift
//  MS Paint Blackjack
//
//  Created by Charley Tran on 2/9/24.
//

import Foundation

class Game {
    var deck: Deck
    var player: Player
    var dealer: Dealer
    
    init() {
        // Control how many decks in game.
        deck = Deck(numOfDecks: 1)
        player = Player(deck: deck)
        dealer = Dealer(deck: deck)
        
        // Starting Hand
        player.hit()
        dealer.hit()
        player.hit()
        dealer.hit()
    }
    
    func stand() {
        // Dealer hits until soft hand total is 18 or more OR hard hand total is 17 or more.
        while(dealer.total <= 17) {
            // Hit if soft 17 or under 17.
            if((dealer.total == 17 && dealer.hardHand == false) || dealer.total < 17) {
                dealer.hit()
            } else {
                break
            }
        }
    }
    
}
