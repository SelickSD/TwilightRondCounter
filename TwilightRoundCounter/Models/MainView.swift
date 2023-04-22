//
//  MainView.swift
//  TwilightRoundCounter
//
//  Created by Сергей Денисенко on 13.04.2023.
//

import UIKit

class MainView: UIView {

    var viewController: GameViewControllerProtocol!
    var USAViewTrailingAnchor: NSLayoutConstraint!
    private var isBlueViewMax: Bool


    //MARK: View
    let USAView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gameBlue
        return view
    }()

    let USSRView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gameRed
        return view
    }()

    let infoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 0.5
        view.layer.cornerRadius = 12
        return view
    }()

    let USABackGroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 0.5
//        view.layer.cornerRadius = 12
        return view
    }()

    let USSABackGroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 0.5
//        view.layer.cornerRadius = 12
        return view
    }()

    //MARK: Button
    lazy var startButton: CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("START", for: .normal)
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        return button
    }()

    lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.addTarget(self, action: #selector(didTapSettingsButton), for: .touchUpInside)
        return button
    }()

    //MARK: Label
    let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Для запуска игры нажми кнопку Start"
        label.font = UIFont(name: "Helvetica Neue", size: 17)
        return label
    }()

    override init(frame: CGRect) {
        isBlueViewMax = true
        super.init(frame: frame)
        drawSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func blueViewMax() {

        let screenSize = UIScreen.main.bounds
        USAViewTrailingAnchor.priority = UILayoutPriority(910)
        //        USAViewTrailingAnchor = USAView.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -screenSize.width * 0.35)


        if isBlueViewMax {
            USAViewTrailingAnchor.priority = UILayoutPriority(900)
            USAViewTrailingAnchor = USAView.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -screenSize.width * 0.35)


            UIView.animate(withDuration: 0.5, delay: 0.0) {
                NSLayoutConstraint.activate([
                    self.USAViewTrailingAnchor
                ])
                self.layoutIfNeeded()
            }
            isBlueViewMax.toggle()

        } else {
            USAViewTrailingAnchor.priority = UILayoutPriority(900)
            USAViewTrailingAnchor = USAView.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: screenSize.width * 0.35)

            UIView.animate(withDuration: 0.5, delay: 0.0) {
                NSLayoutConstraint.activate([
                    self.USAViewTrailingAnchor
                ])
                self.layoutIfNeeded()
            }
            isBlueViewMax.toggle()
        }

    }

    @objc func didTapStartButton() {
        startButton.removeFromSuperview()
        viewController.startGame()
        blueViewMax()
    }

    @objc func didTapSettingsButton() {
        self.addSubview(startButton)
        USAViewTrailingAnchor.priority = UILayoutPriority(900)
        USAViewTrailingAnchor = USAView.trailingAnchor.constraint(equalTo: self.centerXAnchor)
        //        USAViewTrailingAnchor.priority = UILayoutPriority(900)

        UIView.animate(withDuration: 0.5, delay: 0.0) {

            NSLayoutConstraint.activate([self.USAViewTrailingAnchor,
                                         self.startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                         self.startButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                         self.startButton.heightAnchor.constraint(equalToConstant: 50),
                                         self.startButton.widthAnchor.constraint(equalToConstant: 150)
                                        ])

            self.layoutIfNeeded()
        }
        statusLabel.text = "Для запуска игры нажми кнопку Start"
        isBlueViewMax = true
        viewController.resetGame()
    }

    func updateGameStatus(currentRound: Int, currentAction: Int, isFirstAction: Bool) {
        statusLabel.text = "Ход: \(currentAction) Раунд: \(currentRound)"
    }

    private func drawSelf() {
        self.translatesAutoresizingMaskIntoConstraints = false
        USAViewTrailingAnchor = USAView.trailingAnchor.constraint(equalTo: self.centerXAnchor)
        USAViewTrailingAnchor.priority = UILayoutPriority(900)


        self.addSubview(USAView)
        self.addSubview(USSRView)
        self.addSubview(infoView)
        self.addSubview(settingsButton)
        self.addSubview(statusLabel)
        self.addSubview(USABackGroundView)
        self.addSubview(USSABackGroundView)
        self.addSubview(startButton)

        NSLayoutConstraint.activate([
            //MARK: USAView
            USAView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            USAView.topAnchor.constraint(equalTo: self.topAnchor),
            USAView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            USAViewTrailingAnchor,

            //MARK: USSRView
            USSRView.leadingAnchor.constraint(equalTo: USAView.trailingAnchor),
            USSRView.topAnchor.constraint(equalTo: self.topAnchor),
            USSRView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            USSRView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            //MARK: startButton
            startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.widthAnchor.constraint(equalToConstant: 150),
            
            //MARK: infoView
            infoView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            infoView.heightAnchor.constraint(equalToConstant: 50),
            infoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),

            //MARK: settingsButton
            settingsButton.widthAnchor.constraint(equalToConstant: 50),
            settingsButton.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -16),
            settingsButton.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -8),
            settingsButton.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 8),

            //MARK: statusLabel
            statusLabel.centerXAnchor.constraint(equalTo: infoView.centerXAnchor),
            statusLabel.centerYAnchor.constraint(equalTo: infoView.centerYAnchor),
            statusLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 8),

            //MARK: USABackGroundView
            USABackGroundView.leadingAnchor.constraint(equalTo: USAView.leadingAnchor),
            USABackGroundView.trailingAnchor.constraint(equalTo: USAView.trailingAnchor),
            USABackGroundView.bottomAnchor.constraint(equalTo: USAView.bottomAnchor),
            USABackGroundView.topAnchor.constraint(equalTo: USAView.centerYAnchor),

            //MARK: USSABackGroundView
            USSABackGroundView.leadingAnchor.constraint(equalTo: USSRView.leadingAnchor),
            USSABackGroundView.trailingAnchor.constraint(equalTo: USSRView.trailingAnchor),
            USSABackGroundView.bottomAnchor.constraint(equalTo: USSRView.bottomAnchor),
            USSABackGroundView.topAnchor.constraint(equalTo: USSRView.centerYAnchor)
        ])
    }
}
