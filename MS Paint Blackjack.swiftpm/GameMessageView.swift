//
//  GameMessageView.swift
//  MS Paint Blackjack
//
//  Created by Charley Tran on 2/19/24.
//

import SwiftUI

struct GameMessageView: View {
    @ObservedObject var player: Player
    
    var body: some View {
        Text(player.gameMessage)
    }
}

//#Preview {
//    GameMessageView()
//}
