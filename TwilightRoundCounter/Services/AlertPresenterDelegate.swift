//
//  AlertPresenterDelegate.swift
//  TwilightRoundCounter
//
//  Created by Сергей Денисенко on 14.04.2023.
//

import UIKit

protocol AlertPresenterDelegate: AnyObject {
    func didPrepareAlert(alert: UIAlertController?)
}
