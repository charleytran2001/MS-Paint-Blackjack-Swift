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
    let hitNum = Int.random(in: 1...2)
    let standNum = Int.random(in: 1...2)
    
    var body: some View {
        Button(action: {
            withAnimation {
                player.hit()
            }
            if(player.total >= 21) {
                game.stand()
                withAnimation {
                    inGame.toggle()
                }
            }
        }, label: {
            VStack(spacing: 0) {
                Image("hit\(hitNum)")
                    .opacity(player.total >= 21 ? 0.3 : 1)
                Text("HIT")
                    .foregroundColor(.black)
                    .opacity(player.total >= 21 ? 0.3 : 1)
            }
        })
        .disabled(player.total >= 21)
        
        Button(action: {
            game.stand()
            withAnimation {
                inGame.toggle()
            }
        }, label: {
            VStack(spacing: 0) {
                Image("stand\(standNum)")
                Text("STAND")
                    .foregroundColor(.black)
            }
        })
        .disabled(!inGame)
    }
}

//#Preview {
//    PlayerControlView()
//}
