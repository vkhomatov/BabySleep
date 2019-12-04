//
//  PageViewController.swift
//  BabySleep
//
//  Created by Vit on 08.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//


import UIKit
import XCoordinator

class PageViewController: UIPageViewController {
    
    
    let userD = UserDefaultsOperation()
    
    var model: PageViewModel
    let router: UnownedRouter<RegistrationRoute>
    
    
    lazy var mainView: PageViewView = {
           return PageViewView(frame: self.view.frame)
    }()
    
    
    init(model: PageViewModel, router: UnownedRouter<RegistrationRoute>) {
        self.model = model
        self.router = router
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
    }

    convenience required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = model.colorBackground

        setupPageController()
        mainView.setupSubviews(view: self.view, appName: model.nameApp, startButtonTitle: model.startButtonTitle, fontName: model.fontName, logoImageName: model.logoImageName, colorBackground: model.colorBackground)
        mainView.layoutNextButton(view: self.view)
        mainView.nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        
    }
   
    private func setupPageController() {
        
        self.dataSource = self
        self.delegate = self
        
        model.vcFour.delegate = self
        
        model.addViews()
        
        self.setViewControllers([model.pages[model.currentIndex]], direction: .forward, animated: true, completion: nil)
        self.didMove(toParent: self)
        
    }
    
    
    @objc func nextButtonAction(sender: UIButton!) {
            
        if !model.vcFour.model.lastPage {
                
                if model.currentIndex < model.pages.count - 1 {
                    model.currentIndex  += 1
                    self.setViewControllers([model.pages[model.currentIndex]], direction: .forward, animated: true, completion: nil)
                    self.didMove(toParent: self)
                }
            
        } else {
               
            
            let modelFour = model.vcFour.model
            
            let nameChVC = model.vcFour.viewP.childNameTextField
            let dateChVC = model.vcFour.viewP.childDOBTextField
                   
            let nameCh = nameChVC.text ?? ""
            let dateCh = dateChVC.text ?? ""
                   
                   
            if modelFour.testName(childName: nameCh) {
                nameChVC.text = ""
                nameChVC.placeholder = model.childNamePlaceHolderTitle
              //  print("Неверное имя")
                return
            }
            
            if !modelFour.testDate(childDob: dateCh) {
                dateChVC.text = ""
                dateChVC.placeholder = model.childDOBPlaceHolderTitle
              //  print("Неверная дата")
                return
            }
            
            userD.saveChildData(childName: nameCh, childDOB: dateCh, itisBoy: modelFour.childGender)
            print("Данные UserDefaults сохранены")
                    
            
        }
    
    }
    
}


extension PageViewController: PageVCFourControllerDelegate {
    
    func changeNextButtonTitle(text: String) {
     mainView.nextButton.setTitle(text, for: .normal)
    }
    
    func setPickerView(view: UIView) {
        mainView.addSubview(view)
    }
    
}


extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    

        //получаем номер предыдущей страницы
        guard let viewControllerIndex = model.pages.firstIndex(of: viewController) else { return nil }
        
        
        //если это первая страница
        if viewControllerIndex == 0 {
           self.model.currentIndex  = viewControllerIndex
           //print("model.currentIndex = \(model.currentIndex)")
           return nil
        }
          
        if viewControllerIndex < 0 {
           //print("model.currentIndex = \(model.currentIndex)")
           return nil
        }
         
        if viewControllerIndex > 0 {
            model.prevIndex = viewControllerIndex - 1
            self.model.currentIndex -= 1
           // print("model.currentIndex = \(model.currentIndex)")
            return model.pages[model.prevIndex]
         }

         return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        
        //получаем номер следующей страницы
        guard let viewControllerIndex = model.pages.firstIndex(of: viewController) else { return nil }
                
        //последняя страница
        if viewControllerIndex == model.pages.count - 1 {
           self.model.currentIndex  = viewControllerIndex
           //print("model.currentIndex = \(model.currentIndex)")
            
           return nil
            
        }
        
        if viewControllerIndex > model.pages.count - 1 {
           //print("model.currentIndex = \(model.currentIndex)")
           return nil
        }

        //не последняя страница
        if viewControllerIndex < (model.pages.count - 1) {
            model.nextIndex = viewControllerIndex + 1
            self.model.currentIndex  += 1
            //print("model.currentIndex = \(model.currentIndex)")
            return model.pages[model.nextIndex]
        }
 
        return nil
        
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return model.pages.count
    }
    
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return model.currentIndex
    }
    

}
