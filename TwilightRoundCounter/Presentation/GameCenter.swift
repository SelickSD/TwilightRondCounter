//
//  GameCenter.swift
//  TwilightRoundCounter
//
//  Created by Сергей Денисенко on 14.04.2023.
//

import UIKit

class GameCenter {

    private var currentRound = 1
    private var currentAction = 1
    private var isFirstAction = true

    var viewController: GameViewControllerProtocol?

    init(viewController: GameViewControllerProtocol? = nil) {
        self.viewController = viewController
    }

    func startGame() {
        let alert = AlertModel(title: "Начало войны",
                               message: "Раздайте каждому игроку по 8 карт.\nПоложите Карту Китая.\nПоместите дополнительное влияние\n СССР:\n6 единиц в Восточной Европе,\nСША: 7 единиц в Западной Европе\nХод длится 6 раундов",
                               buttonText: "Готово",
                               completion: { _ in })
        viewController?.showAlert(alertModel: alert)
        viewController?.updateGameStatus(currentRound: currentRound, currentAction: currentAction, isFirstAction: isFirstAction)
    }
}
