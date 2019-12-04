//
//  PageViewModel.swift
//  BabySleep
//
//  Created by Vit on 08.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit

class PageViewModel {
    
    let nameApp: String = "Baby Sleep Consultant"
    
    let colorBackground = UIColor(rgb: 0x4FA6A0)
    let fontName = "SFProText-Semibold"
    let startButtonTitle = "Далее"
    
    let logoImageName = "logo"

    
    let childNamePlaceHolderTitle = "Введите имя"
    let childDOBPlaceHolderTitle = "Введите дату"
        
    let vcOne = PageVCOne()
    let vcTwo = PageVCTwo()
    let vcThree = PageVCThree()
    let vcFour = PageVCFour()
    
    var pages: [UIViewController] = []
    var currentIndex: Int = 0
    var nextIndex: Int = 0
    var prevIndex: Int = 0
 
    
    func addViews() {
        pages.append(vcOne)
        pages.append(vcTwo)
        pages.append(vcThree)
        pages.append(vcFour)
    }
    
    
    func switchPage(pageController: UIPageViewController) {
        
        if self.currentIndex  <= pages.count - 1 {
            
            if self.currentIndex < pages.count - 1 {
                self.currentIndex  += 1
            }
            
            pageController.setViewControllers([pages[currentIndex]], direction: .forward, animated: true, completion: nil)
            pageController.didMove(toParent: pageController)
            
        }
        
    }
    
    
}


extension UIColor {
    
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")
       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }
    
   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
    
}
