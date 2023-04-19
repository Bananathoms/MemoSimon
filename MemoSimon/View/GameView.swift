//
//  GameView.swift
//  MemoSimon
//
//  Created by Thomas Carlier on 19/04/2023.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        VStack(spacing: 20){
            HStack(spacing: 20) {
                Button {
                    print("red")
                } label: {
                    Color.red
                        .frame(width: 150, height: 150)
                        .cornerRadius(5)
                }
                Button {
                    print("blue")
                } label: {
                    Color.blue
                        .frame(width: 150, height: 150)
                        .cornerRadius(5)
                }
            }
            HStack(spacing: 20) {
                Button {
                    print("green")
                } label: {
                    Color.green
                        .frame(width: 150, height: 150)
                        .cornerRadius(5)
                }
                Button {
                    print("yellow")
                } label: {
                    Color.yellow
                        .frame(width: 150, height: 150)
                        .cornerRadius(5)
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
