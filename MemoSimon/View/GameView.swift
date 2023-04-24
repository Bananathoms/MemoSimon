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

            
            HStack(spacing: 20) {
                Button {
                    print("red")
                    viewModel.selectColor("red")
                } label: {
                    Color.red
                        .frame(width: 150, height: 150)
                        .cornerRadius(5)
                        .overlay(viewModel.highlightedColor == "red" ? Color.white.opacity(0.5) : Color.clear)
                }.tag("red")
                
                Button {
                    print("blue")
                    viewModel.selectColor("blue")
                } label: {
                    Color.blue
                        .frame(width: 150, height: 150)
                        .cornerRadius(5)
                        .overlay(viewModel.highlightedColor == "blue" ? Color.white.opacity(0.5) : Color.clear)
                }.tag("blue")
            }
            
            HStack(spacing: 20) {
                Button {
                    print("green")
                    viewModel.selectColor("green")
                } label: {
                    Color.green
                        .frame(width: 150, height: 150)
                        .cornerRadius(5)
                        .overlay(viewModel.highlightedColor == "green" ? Color.white.opacity(0.5) : Color.clear)
                }.tag("green")
                
                Button {
                    print("yellow")
                    viewModel.selectColor("yellow")
                } label: {
                    Color.yellow
                        .frame(width: 150, height: 150)
                        .cornerRadius(5)
                        .overlay(viewModel.highlightedColor == "yellow" ? Color.white.opacity(0.5) : Color.clear)
                }.tag("yellow")
                
            }
            Button {
                viewModel.startNewGame()
                
            } label: {
                Text("Nouveau")
            }.background(.black)
                .foregroundColor(.white)
                .tag("new")
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
