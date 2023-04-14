//
//  AlertModel.swift
//  TwilightRoundCounter
//
//  Created by Сергей Денисенко on 13.04.2023.
//

import UIKit

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: (UIAlertAction) -> Void
}
