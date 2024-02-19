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
                .foregroundColor(dealer.total > 21 ? .red : .black)
            
            HStack {
                // Display dealer's first card only before stand, display all cards after stand.
                if(inGame) {
//                    Text("\(dealer.cards[0].suit)\(dealer.cards[0].face)")
//                    Text("??")
                    Image("\(dealer.cards[0].suit)-\(dealer.cards[0].face)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                    Image("\(letters.randomElement() ?? "E")-Back")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                    
                } else {
                    ForEach(dealer.cards, id: \.self) { card in
//                        Text("\(card.suit)\(card.face)")
                        Image("\(card.suit)-\(card.face)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                    }
                }
                
            }
        }
    }
    
}

//#Preview {
//    DealerView()
//}
