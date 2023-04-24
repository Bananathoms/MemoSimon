//
//  GameViewModel.swift
//  MemoSimon
//
//  Created by Thomas Carlier on 19/04/2023.
//

import Foundation

class GameViewModel: ObservableObject {
    
    enum GameState {
        case ready
        case showingSequence
        case userTurn
        case gameOver
    }
    
    @Published var gameState: GameState = .ready
    @Published var selectedColor: String?
    @Published var highlightedColor: String?
    
    private let colors = ["red", "blue", "green", "yellow"]
    private var sequence = [String]()
    private var currentIndex = 0
    
    func startNewGame() {
        gameState = .showingSequence
        sequence = []
        currentIndex = 0
        
        for _ in 1...5 {
            let randomIndex = Int.random(in: 0..<colors.count)
            sequence.append(colors[randomIndex])
        }
        
        showSequence()
    }
    
    private func showSequence() {
        if currentIndex < sequence.count {
            highlightedColor = sequence[currentIndex]
            currentIndex += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.highlightedColor = nil
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.showSequence()
                }
            }
        } else {
            gameState = .userTurn
            currentIndex = 0
        }
    }
    
    func selectColor(_ color: String) {
        if gameState == .userTurn {
            selectedColor = color
            if selectedColor != sequence[currentIndex] {
                gameState = .gameOver
            } else {
                currentIndex += 1
                if currentIndex >= sequence.count {
                    gameState = .showingSequence
                    selectedColor = nil
                    currentIndex = 0
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.startNewGame()
                    }
                }
            }
        }
    }
}

