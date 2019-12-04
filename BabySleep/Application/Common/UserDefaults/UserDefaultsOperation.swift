//
//  UserDefaultsOperation.swift
//  BabySleep
//
//  Created by Vit on 03.12.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//
import UIKit

class UserDefaultsOperation {
    
    // Функция сохранения в User Defaults
       func saveChildData(childName: String, childDOB: String, itisBoy: Bool) {
            let userDefaults = UserDefaults.standard
            userDefaults.set(childName, forKey: "NAME")
            userDefaults.set(childDOB, forKey: "DOB")
            userDefaults.set(itisBoy, forKey: "GENDER")
            userDefaults.set(true, forKey: "RECORD")
          //  print("Имя \(childName) и Дата \(childDOB) записаны в юзер дефаултс")
       }
       
       // Чтение пометки о существовании записи из User Defaults
       var childRecord: Bool? {
            let userDefaultsGet = UserDefaults.standard
            return userDefaultsGet.object(forKey: "RECORD") as? Bool
       }
       
       // Чтение имени из User Defaults
       var childNameRead: String? {
            let userDefaultsGet = UserDefaults.standard
            return userDefaultsGet.object(forKey: "NAME") as? String
       }
       
       // Чтение даты из User Defaults
       var childDOBRead: String? {
           let userDefaultsGet = UserDefaults.standard
           return userDefaultsGet.object(forKey: "DOB") as? String
       }
       
       // Чтение пола из User Defaults
       var childGenderRead: Bool? {
           let userDefaultsGet = UserDefaults.standard
           return userDefaultsGet.object(forKey: "GENDER") as? Bool
       }

    
}
