//
//  GameViewController.swift
//  TwilightRoundCounter
//
//  Created by Сергей Денисенко on 13.04.2023.
//

import UIKit

class GameViewController: UIViewController, GameViewControllerProtocol, AlertPresenterDelegate {

    private let mainView = MainView()
    private var gameCenter: GameCenter!
    private var alertPresenter: AlertPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        gameCenter = GameCenter(viewController: self)
        alertPresenter = AlertPresenter(delegate: self)
        setupView()
    }
    
    private func setupView() {
        mainView.viewController = self
        view.addSubview(mainView)

        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func showAlert(alertModel: AlertModel?) {
        alertPresenter?.showAlert(alertModel: alertModel)
    }

    func didPrepareAlert(alert: UIAlertController?) {
        guard let alert = alert else { return }
        DispatchQueue.main.async { () -> Void in
            self.present(alert, animated: true, completion: nil)
        }
    }

    func startGame() {
        gameCenter.startGame()
        setupGesture()
    }

    func updateGameStatus(currentRound: Int, currentAction: Int, isFirstAction: Bool) {
        mainView.updateGameStatus(currentRound: currentRound, currentAction: currentAction, isFirstAction: isFirstAction)
    }

    private func setupGesture() {
        let blueGesture = UITapGestureRecognizer(target: self, action: #selector(blueViewTapped))
        mainView.addGestureRecognizer(blueGesture)
        mainView.isUserInteractionEnabled = true

//        let redGesture = UITapGestureRecognizer(target: self, action: #selector(redViewTapped))
//        mainView.USSRView.addGestureRecognizer(redGesture)
//        mainView.USSRView.isUserInteractionEnabled = true
    }

    func changeView() {
        mainView.blueViewMax()
    }

    @objc private func blueViewTapped() {
        gameCenter.switchAction()
    }

//    @objc private func redViewTapped() {
//        mainView.blueViewMax()
//    }
}
