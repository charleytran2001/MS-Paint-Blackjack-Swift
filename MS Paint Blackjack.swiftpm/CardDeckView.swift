//
//  CardDeckView.swift
//  MS Paint Blackjack
//
//  Created by Charley Tran on 2/9/24.
//

import SwiftUI

struct CardDeckView: View {
    @ObservedObject var deck: Deck
    
    var body: some View {
        Text("Cards Left: \(deck.totalCards)")
        Text("Cards Drawn: \(deck.drawnCards)")
    }
}

//#Preview {
//    CardDeckView()
//}
