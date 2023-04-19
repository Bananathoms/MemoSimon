//
//  GameViewModel.swift
//  MemoSimon
//
//  Created by Thomas Carlier on 19/04/2023.
//

import Foundation

class GameViewModel: ObservableObject {
    
    // Les couleurs possibles
    let colors = ["red", "blue", "green", "yellow"]
    
    // La couleur sélectionnée
    @Published var selectedColor: String?
    
    // Générer une couleur aléatoire
    func randomColor() -> String {
        return colors.randomElement()!
    }
    
    // Définir la couleur sélectionnée
    func selectColor(_ color: String) {
        selectedColor = color
    }
}
