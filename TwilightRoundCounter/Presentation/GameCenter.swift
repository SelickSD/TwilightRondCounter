//
//  GameCenter.swift
//  TwilightRoundCounter
//
//  Created by Сергей Денисенко on 14.04.2023.
//

import UIKit

class GameCenter {

    var viewController: GameViewControllerProtocol?

    init(viewController: GameViewControllerProtocol? = nil) {
        self.viewController = viewController
    }

    func showAlert(alertModel: AlertModel?) {
        print(1)
    }

    
}
