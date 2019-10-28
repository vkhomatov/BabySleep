//
//  Sleep.swift
//  BabySleep
//
//  Created by Igor on 28.10.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import Foundation
import RealmSwift

class Sleep: Object {
    
    @objc dynamic var uuid: String = ""
    @objc dynamic var startSleepTime: Date = Date.init(timeIntervalSinceNow: 0)
    @objc dynamic var endSleepTime: Date = Date.init(timeIntervalSinceNow: 0)
    @objc dynamic var statusIsEnded: Bool = false
    @objc dynamic var comments: String = ""
    
    convenience init(uuid: String, startSleepTime: Date, endSleepTime: Date, statusIsEnded: Bool, comments: String) {
        self.init()
        self.uuid = uuid
        self.startSleepTime = startSleepTime
        self.endSleepTime = endSleepTime
        self.statusIsEnded = statusIsEnded
        self.comments = comments
    }
    
    override static func primaryKey() -> String? {
        return "uuid"
    }
}
