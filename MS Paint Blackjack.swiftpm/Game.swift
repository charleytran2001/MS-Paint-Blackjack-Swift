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
    
    init() {
        deck = Deck(numOfDecks: 1)
        player = Player(deck: deck)
    }
    
}
