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
                }.tag("red")
                
                Button {
                    print("blue")
                    viewModel.selectColor("blue")
                } label: {
                    Color.blue
                        .frame(width: 150, height: 150)
                        .cornerRadius(5)
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
                }.tag("green")
                
                Button {
                    print("yellow")
                    viewModel.selectColor("yellow")
                } label: {
                    Color.yellow
                        .frame(width: 150, height: 150)
                        .cornerRadius(5)
                }.tag("yellow")
                
            }
            Button {
                print("new")
                viewModel.selectColor(viewModel.randomColor())
                
            } label: {
                Text("Nouveau")
            }.background(.black)
                .foregroundColor(.white)
                .tag("new")
            
            if let selectedColor = viewModel.selectedColor {
                            Text("Couleur sélectionnée: \(selectedColor)")
                        }
        }

    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
