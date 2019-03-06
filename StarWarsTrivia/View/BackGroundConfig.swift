//
//  BackGroundConfig.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 20/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
//

import UIKit

class ViewDecorate : UIView {
    override func awakeFromNib() {
        layer.cornerRadius = 10
        layer.backgroundColor = UIColor.black.withAlphaComponent(0.6).cgColor
    }
}


class ButtonDecorate : UIButton {
    override func awakeFromNib() {
        layer.cornerRadius = 10
        layer.backgroundColor = UIColor.black.withAlphaComponent(0.6).cgColor
    }
}
