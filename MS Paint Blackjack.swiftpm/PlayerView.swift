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
        VStack {
            Text("Player: \(player.total)")
            
            HStack {
                ForEach(player.cards, id: \.self) { card in
                    Text("\(card.suit)\(card.face)")
                }
            }
        }
    }
    
}

//#Preview {
//    PlayerView()
//}
