//
//  CustomButton.swift
//  TwilightRoundCounter
//
//  Created by Сергей Денисенко on 13.04.2023.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isHighlighted: Bool {
        didSet {
            guard let color = backgroundColor else { return }

            UIView.animate(withDuration: self.isHighlighted ? 0 : 0.4, delay: 0.0, options: [.beginFromCurrentState, .allowUserInteraction], animations: {
                self.backgroundColor = color.withAlphaComponent(self.isHighlighted ? 0.3 : 1)
            })
        }
    }
}
