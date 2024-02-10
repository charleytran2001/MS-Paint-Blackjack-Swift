//
//  CardDeck.swift
//  MS Paint Blackjack
//
//  Created by Charley Tran on 2/5/24.
//

import Foundation

struct Card: Hashable {
    let suit: String
    let face: String
    
    init(suit: String, face: String) {
        self.suit = suit
        self.face = face
    }
}

class Deck: ObservableObject {
    var deckArray: [Card] = []

    let suitArray = ["S", "H", "C", "D"]
    let faceArray = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    
    @Published var totalCards = 0
    @Published var drawnCards = 0
    
    init(numOfDecks: Int) {
        for _ in 1...numOfDecks {
            for suit in suitArray {
                for face in faceArray {
                    let card = Card(suit: suit, face: face)
                    deckArray.append(card)
                    totalCards += 1
                }
            }
        }
        deckArray.shuffle()
    }
    
    func drawCard() -> Card {
        drawnCards += 1
        return deckArray.last!
    }
    
    func removeLastCard() {
        totalCards -= 1
        deckArray.removeLast()
    }
}
