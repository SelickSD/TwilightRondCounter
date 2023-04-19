//
//  GameViewControllerProtocol.swift
//  TwilightRoundCounter
//
//  Created by Сергей Денисенко on 14.04.2023.
//

import Foundation

protocol GameViewControllerProtocol {
    func showAlert(alertModel: AlertModel?)
    func startGame()
    func updateGameStatus(currentRound: Int, currentAction: Int, isFirstAction: Bool)
    func changeView()
    func resetGame()
}


