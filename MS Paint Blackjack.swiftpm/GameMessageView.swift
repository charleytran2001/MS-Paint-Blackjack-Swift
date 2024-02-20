//
//  GameMessageView.swift
//  MS Paint Blackjack
//
//  Created by Charley Tran on 2/19/24.
//

import SwiftUI

struct GameMessageView: View {
    @ObservedObject var game: Game
    @ObservedObject var player: Player
    @Binding var inGame: Bool
    
    var body: some View {
        if(player.total > 21 && !inGame) {
            VStack(spacing: 0) {
                Text(player.gameMessage)
                Text(game.gameVictor)
            }
        } else if(!inGame) {
            Text(game.gameVictor)
        } else {
            Text(player.gameMessage)
        }
        
    }
}

//#Preview {
//    GameMessageView()
//}
