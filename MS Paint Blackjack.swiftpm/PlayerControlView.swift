//
//  PlayerControlView.swift
//  MS Paint Blackjack
//
//  Created by Charley Tran on 2/14/24.
//

import SwiftUI

struct PlayerControlView: View {
    @ObservedObject var game: Game
    @ObservedObject var player: Player
    @Binding var inGame: Bool
    
    var body: some View {
        Button("Hit", action: {
            player.hit()
        })
        .disabled(player.total >= 21)
        
        Button("Stand", action: {
            game.stand()
            inGame.toggle()
        })
    }
}

//#Preview {
//    PlayerControlView()
//}
