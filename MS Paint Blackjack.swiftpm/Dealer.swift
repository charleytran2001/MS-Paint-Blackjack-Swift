//
//  Dealer.swift
//  MS Paint Blackjack
//
//  Created by Charley Tran on 2/13/24.
//

import Foundation

class Dealer: Player {
    
    override init(deck: Deck) {
        super.init(deck: deck)
    }
    
    // Converts face string into an int value.
    func face2Value(face: String) -> Int {
        if(face == "A") {
            return 11
        } else if(face == "J" || face == "Q" || face == "K") {
            return 10
        } else {
            return Int(face)!
        }
    }
}
