//
//  MainView.swift
//  TwilightRoundCounter
//
//  Created by Сергей Денисенко on 13.04.2023.
//

import UIKit

class MainView: UIView {

    var viewController: GameViewControllerProtocol!

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
        super.init(frame: frame)

        drawSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didTapStartButton() {
        startButton.removeFromSuperview()
        viewController.startGame()
    }

    private func drawSelf() {
        self.translatesAutoresizingMaskIntoConstraints = false


        self.addSubview(USAView)
        self.addSubview(USSRView)
        self.addSubview(startButton)
        self.addSubview(infoView)
        self.addSubview(settingsButton)
        self.addSubview(statusLabel)

        NSLayoutConstraint.activate([
            //MARK: USAView
            USAView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            USAView.topAnchor.constraint(equalTo: self.topAnchor),
            USAView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            USAView.trailingAnchor.constraint(equalTo: self.centerXAnchor),

            //MARK: USSRView
            USSRView.leadingAnchor.constraint(equalTo: self.centerXAnchor),
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
            statusLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 8)
        ])
    }
}
