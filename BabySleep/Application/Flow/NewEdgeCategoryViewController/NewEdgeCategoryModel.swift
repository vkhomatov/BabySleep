//
//  NewEdgeCategoryModel.swift
//  BabySleep
//
//  Created by Vit on 03.12.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit

class NewEdgeCategoryModel {
    
    func resetDefaults() {
        
        guard let domain = Bundle.main.bundleIdentifier else { return }
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        /*  let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        } */
    }
}
