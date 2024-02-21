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
    let letter = ["C", "D", "E"].randomElement() ?? "E"

    var body: some View {
        VStack(spacing: 5) {
            // Display dealer's card total.
            Text(inGame ? "DEALER TOTAL: \(dealer.face2Value(face: dealer.cards[0].face))" : "DEALER TOTAL: \(dealer.total)")
                .foregroundColor(dealer.total == 21 && !inGame ? .green : (dealer.total > 21 ? .red : .black))
            
            HStack {
                // Display dealer's first card only before stand, display all cards after stand.
                VStack(spacing: 0) {
                    Image("\(dealer.cards[0].suit)-\(dealer.cards[0].face)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                    Text("\(dealer.suit2Icon(suit: dealer.cards[0].suit))\(dealer.cards[0].face)")
                        .foregroundColor(dealer.cards[0].suit == "S" || dealer.cards[0].suit == "C" ? .black : .red)
                }
                if(inGame) {
                    VStack(spacing: 0) {
                        Image("\(letter)-Back")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
//                            .rotation3DEffect(.degrees(0), axis: (x: 0, y: 1, z: 0))
                        Text("??")
                    }
                } else {
                    VStack(spacing: 0) {
                        Image("\(dealer.cards[1].suit)-\(dealer.cards[1].face)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
//                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        Text("\(dealer.suit2Icon(suit: dealer.cards[1].suit))\(dealer.cards[1].face)")
                            .foregroundColor(dealer.cards[1].suit == "S" || dealer.cards[1].suit == "C" ? .black : .red)
                    }
                    
                    ForEach(Array(dealer.cards.enumerated()), id: \.element) { index, card in
                        if(index >= 2) {
                            VStack(spacing: 0) {
                                Image("\(card.suit)-\(card.face)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 150)
                                Text("\(dealer.suit2Icon(suit: card.suit))\(card.face)")
                                    .foregroundColor(card.suit == "S" || card.suit == "C" ? .black : .red)
                            }
                            .transition(.move(edge: .trailing))
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
