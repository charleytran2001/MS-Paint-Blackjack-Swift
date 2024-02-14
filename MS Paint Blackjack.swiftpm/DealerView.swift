//
//  DealerView.swift
//  MS Paint Blackjack
//
//  Created by Charley Tran on 2/10/24.
//

import SwiftUI

struct DealerView: View {
    @ObservedObject var dealer: Dealer
    @Binding var inGame: Bool

    var body: some View {
        VStack {
            // Display dealer's card total.
            Text(inGame ? "Dealer Total: \(dealer.face2Value(face: dealer.cards[0].face))" : "Dealer Total: \(dealer.total)")
            
            HStack {
                // Display dealer's first card only before stand, display all cards after stand.
                if(inGame) {
                    Text("\(dealer.cards[0].suit)\(dealer.cards[0].face)")
                    Text("??")
                } else {
                    ForEach(dealer.cards, id: \.self) { card in
                        Text("\(card.suit)\(card.face)")
                    }
                }
                
            }
        }
    }
    
}

//#Preview {
//    DealerView()
//}
