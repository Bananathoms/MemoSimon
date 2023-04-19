//
//  GameModel.swift
//  MemoSimon
//
//  Created by Thomas Carlier on 19/04/2023.
//

import Foundation

// Déclaration d'un tableau contenant les couleurs des carrés
let colors = [Color.red, Color.green, Color.blue, Color.yellow]

// Déclaration d'une variable pour stocker la couleur sélectionnée aléatoirement
@State var selectedColor: Color = Color.clear

func randomlyClickButton() {
    let randomIndex = Int.random(in: 0..<colors.count)
    let selectedButton = self.body.children[randomIndex] as! Button<Rectangle>
    selectedButton.trigger()
}
