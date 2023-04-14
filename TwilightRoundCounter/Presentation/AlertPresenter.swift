//
//  AlertPresenter.swift
//  TwilightRoundCounter
//
//  Created by Сергей Денисенко on 14.04.2023.
//

import UIKit

class AlertPresenter: AlertPresenterProtocol {

    weak var delegate: AlertPresenterDelegate?

    init(delegate: AlertPresenterDelegate? = nil) {
        self.delegate = delegate
    }

    func showAlert(alertModel: AlertModel?) {

        guard let alertModel = alertModel else { return }

        let alert = UIAlertController(title: alertModel.title,
                                      message: alertModel.message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: alertModel.buttonText, style: .default, handler: alertModel.completion)
        alert.addAction(action)

        delegate?.didPrepareAlert(alert: alert)
    }
}
