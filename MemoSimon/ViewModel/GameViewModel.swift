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
    @Published var score = 0
    @Published var highScore = 0
    @Published var isHighScoreBeaten: Bool = false
    
    private let colors = ["red", "blue", "green", "yellow"]
    private var sequence = [String]()
    private var currentIndex = 0
    
    func startNewGame() {
        gameState = .showingSequence
        if gameState == .ready {
            sequence = [colors.randomElement()!]
        } else {
            sequence.append(colors.randomElement()!)
        }
        currentIndex = 0
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.gameState = .ready
                    self.score = 0
                    self.isHighScoreBeaten = false
                    self.sequence = []
                }
            } else {
                currentIndex += 1
                self.score += 1
                if self.score > self.highScore {
                    self.highScore = self.score
                    self.isHighScoreBeaten = true
                }
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

