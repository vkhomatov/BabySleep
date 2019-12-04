//
//  PageVCModelFour.swift
//  BabySleep
//
//  Created by Vit on 15.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit

// Проверка на пробелы в String
struct TestString {
    static func blank(text: String) -> Bool {
    let trimmed = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    return trimmed.isEmpty
    }
}


class PageVCModelFour {

    
    let text7: String = "Расскажите про Вашего малыша, чтобы мы могли давать советы, соответствующие его возрасту"
    let childNameText: String = "Имя ребёнка"
    let childDOBText: String = "Дата рождения"
    let childGenderText: String = "Пол ребёнка"
    
    let dateFormatter = DateFormatter()
    
    var selectedDate: String = ""
    var childGender = true
    var lastPage = false

    
    // Функция проверки на корректность ввода имени
    func testName(childName: String) -> Bool {
        return TestString.blank(text: childName)
    }
    
    // Функция проверки на корректность ввода даты
    func testDate(childDob: String) -> Bool {
        let addedDateFormatter = DateFormatter()
        addedDateFormatter.dateFormat = "MM.dd.yyyy"
        
        if addedDateFormatter.date(from: childDob) != nil {
            return true
        } else {
            return false }
        
    }
    
/*    // Функция сохранения в User Defaults
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
    } */

}
