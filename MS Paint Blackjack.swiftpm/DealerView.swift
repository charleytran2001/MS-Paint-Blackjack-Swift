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
    let letters = ["C", "D", "E"]

    var body: some View {
        VStack(spacing: 5) {
            // Display dealer's card total.
            Text(inGame ? "DEALER TOTAL: \(dealer.face2Value(face: dealer.cards[0].face))" : "DEALER TOTAL: \(dealer.total)")
                .foregroundColor(dealer.total == 21 && !inGame ? .green : (dealer.total > 21 ? .red : .black))
            
            HStack {
                // Display dealer's first card only before stand, display all cards after stand.
                if(inGame) {
                    VStack(spacing: 0) {
                        Image("\(dealer.cards[0].suit)-\(dealer.cards[0].face)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                        Text("\(dealer.suit2Icon(suit: dealer.cards[0].suit))\(dealer.cards[0].face)")
                            .foregroundColor(dealer.cards[0].suit == "S" || dealer.cards[0].suit == "C" ? .black : .red)
                    }
                    VStack(spacing: 0) {
                        Image("\(letters.randomElement() ?? "E")-Back")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                        Text("??")
                    }
                } else {
                    ForEach(dealer.cards, id: \.self) { card in
                        VStack(spacing: 0) {
                            Image("\(card.suit)-\(card.face)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 150)
                            Text("\(dealer.suit2Icon(suit: card.suit))\(card.face)")
                                .foregroundColor(card.suit == "S" || card.suit == "C" ? .black : .red)
                        }
                        
                    }
                }
                
            }
        }
    }
    
}

//#Preview {
//    DealerView()
//}
