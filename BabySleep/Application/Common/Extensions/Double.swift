//
//  Double.swift
//  BabySleep
//
//  Created by Денис Львович on 18/11/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit

extension Double {
    var scaled: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return screenWidth * CGFloat(self) / 375.0
    }
}
