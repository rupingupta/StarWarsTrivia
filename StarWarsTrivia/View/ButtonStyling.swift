//
//  ButtonStyling.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 23/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
//

import UIKit


class ButtonStyling : UIButton {
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.3) {
                     self.alpha = 1.0
                }
               
            }
            else {
                UIView.animate(withDuration: 0.3) {
                    self.alpha = 0.5
                }
            }
        }
    }
}
