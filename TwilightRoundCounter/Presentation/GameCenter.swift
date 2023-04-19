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

    func resetGame() {
        currentRound = 1
        currentAction = 1
        isFirstAction = true
    }

    func startGame() {
        let alert = AlertModel(title: "Начало войны",
                               message: "Раздайте каждому игроку по 8 карт.\nПоложите Карту Китая.\nПоместите дополнительное влияние\n СССР:\n6 единиц в Восточной Европе,\nСША: 7 единиц в Западной Европе\nХод длится 6 раундов",
                               buttonText: "Готово",
                               completion: { _ in })
        viewController?.showAlert(alertModel: alert)
        viewController?.updateGameStatus(currentRound: currentRound, currentAction: currentAction, isFirstAction: isFirstAction)
//        viewController?.setupGesture()
    }

    private func startMiddleGame() {

        let alert = AlertModel(title: "Середина войны",
                                      message: "В начале 4го хода в колоду замешиваются и раздаются карты середины войны\nОтбой в колоду не замешивается\nИгроки получают по 9 карт\nХод длится 7 раундов",
                               buttonText: "Готово",
                               completion: { _ in })
        viewController?.showAlert(alertModel: alert)
    }

    private func startEndGame() {

        let alert = AlertModel(title: "Окончание войны",
                                      message: "В начале 8го хода в колоду замешиваются и раздаются карты Окончания войны\nОтбой в колоду не замешивается\nИгроки получают по 9 карт\nХод длится 7 раундов",
                               buttonText: "Готово",
                               completion: { _ in })
        viewController?.showAlert(alertModel: alert)
    }

    private func startNewAction() {
        let alert = AlertModel(title: "Новый ход: \(currentAction)",
                                      message: "Обновите руку и сыграйте фазу заголовков",
                               buttonText: "Ок",
                               completion: { _ in })
        viewController?.showAlert(alertModel: alert)
    }

    func switchAction() {
        switch currentAction {
        case 1...3:
            if currentRound < 6 {
                if isFirstAction {
                    isFirstAction.toggle()
                    viewController?.changeView()
                } else {
                    isFirstAction.toggle()
                    currentRound += 1
                    viewController?.updateGameStatus(currentRound: currentRound, currentAction: currentAction, isFirstAction: isFirstAction)
                    viewController?.changeView()
                }
            } else {
                if isFirstAction {
                    isFirstAction.toggle()
                    viewController?.changeView()
                } else if currentAction == 3 {
                    isFirstAction.toggle()
                    currentRound = 1
                    currentAction += 1
                    viewController?.updateGameStatus(currentRound: currentRound, currentAction: currentAction, isFirstAction: isFirstAction)
                    viewController?.changeView()
                    startMiddleGame()
                } else {
                    isFirstAction.toggle()
                    currentRound = 1
                    currentAction += 1
                    viewController?.updateGameStatus(currentRound: currentRound, currentAction: currentAction, isFirstAction: isFirstAction)
                    viewController?.changeView()
                    startNewAction()
                }
            }
        case 4...7:
            if currentRound < 7 {
                if isFirstAction {
                    isFirstAction.toggle()
                    viewController?.changeView()

                } else {
                    isFirstAction.toggle()
                    currentRound += 1
                    viewController?.updateGameStatus(currentRound: currentRound, currentAction: currentAction, isFirstAction: isFirstAction)
                    viewController?.changeView()
                }
            } else {
                if isFirstAction {
                    isFirstAction.toggle()
                    viewController?.changeView()
                } else if currentAction == 7 {
                    isFirstAction.toggle()
                    currentRound = 1
                    currentAction += 1
                    viewController?.updateGameStatus(currentRound: currentRound, currentAction: currentAction, isFirstAction: isFirstAction)
                    viewController?.changeView()
                    startEndGame()
                } else {
                    isFirstAction.toggle()
                    currentRound = 1
                    currentAction += 1
                    viewController?.updateGameStatus(currentRound: currentRound, currentAction: currentAction, isFirstAction: isFirstAction)
                    viewController?.changeView()
                    startNewAction()
                }
            }

        case 10:
            if currentRound < 7 {
                if isFirstAction {
                    isFirstAction.toggle()
                    viewController?.changeView()

                } else {
                    isFirstAction.toggle()
                    currentRound += 1
                    viewController?.updateGameStatus(currentRound: currentRound, currentAction: currentAction, isFirstAction: isFirstAction)
                    viewController?.changeView()
                }
            } else {
                if isFirstAction {
                    isFirstAction.toggle()
                    viewController?.changeView()
                } else {
                    let alert = AlertModel(title: "Конец Игры",
                                                  message: "Выполните финальный подсчет очков",
                                                  buttonText: "Ок",
                                                  completion: { _ in })
                    viewController?.showAlert(alertModel: alert)
                }
            }
        default:
            break
        }
    }
}
