//
//  SleepRealm.swift
//  BabySleep
//
//  Created by Igor on 28.10.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import Foundation
import RealmSwift

class SleepRealm: Object, Sleep {

    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var startSleepTime: Date = Date.init(timeIntervalSinceNow: 0)
    @objc dynamic var endSleepTime: Date?
    @objc dynamic var comment: String = ""

    var isEnded: Bool {
        return self.endSleepTime != nil
    }

    convenience init(startSleepTime: Date, endSleepTime: Date?, comment: String) {
        self.init()

        self.startSleepTime = startSleepTime
        self.endSleepTime = endSleepTime
        self.comment = comment
    }
    
    override static func primaryKey() -> String? {
        return "uuid"
    }
}
