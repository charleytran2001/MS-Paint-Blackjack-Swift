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
    var hardHand = true
    var gameMessage = "Good Luck!"
    var gameMessageNum = 0
    
    func hit() {
        if(total < 21 && deck.totalCards != 0) {
            let card = deck.drawCard()
            cards.append(card)
            
            if(card.face == "A") {
                // If first Ace, add 11 to total. Otherwise add 1.
                if(aceCheck == false) {
                    aceCheck = true
                    hardHand = false
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
        
        if(total > 21) {
            gameMessageNum = Int.random(in: 1...11)
        } else if(total < 21) {
            gameMessageNum = Int.random(in: 12...21)
        } else if(total == 21) {
            gameMessageNum = Int.random(in: 22...23)
        }
        
        switch(gameMessageNum) {
        case 1:
            gameMessage = "Oops"
        case 2:
            gameMessage = "Whoops"
        case 3:
            gameMessage = "That's not good"
        case 4:
            gameMessage = "Uh-oh"
        case 5:
            gameMessage = "Oof"
        case 6:
            gameMessage = "Oopsy Daisy"
        case 7:
            gameMessage = "Yikes"
        case 8:
            gameMessage = "How did that happen"
        case 9:
            gameMessage = "Sadness"
        case 10:
            gameMessage = ":("
        case 11:
            gameMessage = "That's a problem"
        case 12:
            gameMessage = "Hmmmmm..."
        case 13:
            gameMessage = "I wonder..."
        case 14:
            gameMessage = "Let's see..."
        case 15:
            gameMessage = "Think about this..."
        case 16:
            gameMessage = "What now..."
        case 17:
            gameMessage = "Uhhh..."
        case 18:
            gameMessage = "Maybe..."
        case 19:
            gameMessage = "Perhaps..."
        case 20:
            gameMessage = "I CAN SEE IT!"
        case 21:
            gameMessage = "What to do..."
        case 22:
            gameMessage = "Lucky!"
        case 23:
            gameMessage = "Nice!"
        default:
            gameMessage = "Good Luck!"
        }
    }
}
