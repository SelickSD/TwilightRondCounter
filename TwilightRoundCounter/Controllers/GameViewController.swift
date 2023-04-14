//
//  GameViewController.swift
//  TwilightRoundCounter
//
//  Created by Сергей Денисенко on 13.04.2023.
//

import UIKit

class GameViewController: UIViewController {

    private let mainView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        view.addSubview(mainView)

        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
