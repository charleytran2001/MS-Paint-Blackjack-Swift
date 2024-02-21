//
//  PlayerView.swift
//  MS Paint Blackjack
//
//  Created by Charley Tran on 2/9/24.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var player: Player

    var body: some View {
        VStack(spacing: 5) {
            // Display player's card total.
            Text("PLAYER TOTAL: \(player.total)")
                .foregroundColor(player.total == 21 ? .green : (player.total > 21 ? .red : .black))
            
            HStack {
                // Display all player cards.
                ForEach(player.cards, id: \.self) { card in
                    VStack(spacing: 0) {
                        Image("\(card.suit)-\(card.face)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                        Text("\(player.suit2Icon(suit: card.suit))\(card.face)")
                            .foregroundColor(card.suit == "S" || card.suit == "C" ? .black : .red)
                    }
                    .transition(.move(edge: .trailing))
                }
            }
        }
    }
    
}

//#Preview {
//    PlayerView()
//}
