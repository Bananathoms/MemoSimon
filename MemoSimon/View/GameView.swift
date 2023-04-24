//
//  GameView.swift
//  MemoSimon
//
//  Created by Thomas Carlier on 19/04/2023.
//

import SwiftUI

struct GameView: View {

    @StateObject var viewModel = GameViewModel()

    
    var body: some View {
        VStack(spacing: 20){
            HStack(spacing: 50){
                Text("Score: \(viewModel.score)")
                Text("Record: \(viewModel.highScore)")
                    .foregroundColor(viewModel.isHighScoreBeaten ? .green : .black)
            }
            
            HStack(spacing: 20) {
                Button {
                    viewModel.selectColor("red")
                } label: {
                    Color.red
                        .frame(width: 150, height: 150)
                        .cornerRadius(5)
                        .overlay(viewModel.highlightedColor == "red" ? Color.white.opacity(0.5) : Color.clear)
                }
                .disabled(viewModel.gameState != .userTurn)
                
                Button {
                    viewModel.selectColor("blue")
                } label: {
                    Color.blue
                        .frame(width: 150, height: 150)
                        .cornerRadius(5)
                        .overlay(viewModel.highlightedColor == "blue" ? Color.white.opacity(0.5) : Color.clear)
                }
            }
            .disabled(viewModel.gameState != .userTurn)
            
            HStack(spacing: 20) {
                Button {
                    viewModel.selectColor("green")
                } label: {
                    Color.green
                        .frame(width: 150, height: 150)
                        .cornerRadius(5)
                        .overlay(viewModel.highlightedColor == "green" ? Color.white.opacity(0.5) : Color.clear)
                }
                .disabled(viewModel.gameState != .userTurn)
                
                Button {
                    viewModel.selectColor("yellow")
                } label: {
                    Color.yellow
                        .frame(width: 150, height: 150)
                        .cornerRadius(5)
                        .overlay(viewModel.highlightedColor == "yellow" ? Color.white.opacity(0.5) : Color.clear)
                }
                .disabled(viewModel.gameState != .userTurn)
            }
            
            if viewModel.gameState == .ready {
                Button(action: {
                    viewModel.startNewGame()
                }, label: {
                    Text("Nouveau")
                })
                .background(.black)
                .foregroundColor(.white)
            } else if viewModel.gameState == .showingSequence {
                Text("Mémorisez la séquence...")
            } else if viewModel.gameState == .userTurn {
                Text("À vous de jouer!")
            } else if viewModel.gameState == .gameOver {
                Text("Game over!")
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            viewModel.gameState = .ready
                        }
                    }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
