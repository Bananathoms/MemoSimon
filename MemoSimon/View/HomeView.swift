//
//  HomeView.swift
//  MemoSimon
//
//  Created by Thomas Carlier on 03/05/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Bienvenue dans MemoSimon")
                    .font(.title)
                    .fontWeight(.bold)
                
                NavigationLink(destination: GameView()) {
                    Text("Nouvelle Partie")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(15)
                }
            }
            .padding()
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
