//
//  Game.swift
//  MS Paint Blackjack
//
//  Created by Charley Tran on 2/9/24.
//

import Foundation

class Game: ObservableObject {
    var deck: Deck
    var player: Player
    var dealer: Dealer
    var gameVictor = ""
    
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
        
        switch(true) {
        case (dealer.total == 21 && dealer.cards.count == 2):
            gameVictor = "Dealer Blackjack: You Lose"
        case (player.total == 21 && player.cards.count == 2):
            gameVictor = "Blackjack: You Win"
        case (player.total > 21):
            gameVictor = "Bust: You Lose"
        case (dealer.total > 21):
            gameVictor = "Dealer Bust: You Win"
        case (player.total < dealer.total):
            gameVictor = "Smaller Hand: You Lose"
        case (player.total > dealer.total):
            gameVictor = "Bigger Hand: You Win"
        case (player.total == dealer.total):
            gameVictor = "Equal Hands: It's a Tie"
        default:
            gameVictor = "uh oh"
        }
        
    }
    
}
