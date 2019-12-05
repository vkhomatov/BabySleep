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
    
    let minDate = Date(timeIntervalSinceReferenceDate: 31536000)
    let maxDate = Date()
    
    var selectedDate: String = ""
    var childGender = true
    var lastPage = false

    
    // Функция проверки на корректность ввода имени
    func testName(childName: String) -> Bool {
        return TestString.blank(text: childName)
    }
    
    // Функция проверки на корректность ввода даты
    func testDate(childDob: String) -> Bool {

        guard let date = dateFormatter.date(from: childDob) else { return false }
        
        if date <= maxDate && date >= minDate {
            return true
        }
        
        return false
    }
    
    
}
