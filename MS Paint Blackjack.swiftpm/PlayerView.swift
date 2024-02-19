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
                .foregroundColor(player.total > 21 ? .red : .black)
            
            HStack {
                // Display all player cards.
                ForEach(player.cards, id: \.self) { card in
//                    Text("\(card.suit)\(card.face)")
                    Image("\(card.suit)-\(card.face)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                }
            }
        }
    }
    
}

//#Preview {
//    PlayerView()
//}
