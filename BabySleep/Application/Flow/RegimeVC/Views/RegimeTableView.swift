//
//  RegimeTableView.swift
//  BabySleep
//
//  Created by Денис Львович on 18/11/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit

class RegimeTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {

        super.init(frame: frame, style: style)

        self.rowHeight = 78.0.scaled

        self.backgroundColor = .tableBackground
        self.separatorStyle = .none
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
