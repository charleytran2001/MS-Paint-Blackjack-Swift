//
//  DealerView.swift
//  MS Paint Blackjack
//
//  Created by Charley Tran on 2/10/24.
//

import SwiftUI

struct DealerView: View {
    @ObservedObject var dealer: Player

    var body: some View {
        VStack {
            Text("Dealer: \(dealer.total)")
            
            HStack {
                ForEach(dealer.cards, id: \.self) { card in
                    Text("\(card.suit)\(card.face)")
                }
            }
        }
    }
    
}

//#Preview {
//    DealerView()
//}
