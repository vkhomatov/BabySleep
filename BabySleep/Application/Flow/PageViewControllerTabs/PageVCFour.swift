//
//  PageVCFour.swift
//  BabySleep
//
//  Created by Vit on 15.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit


protocol PageVCFourControllerDelegate: class {
    func changeNextButtonTitle(text: String)
    func setPickerView(view: UIView)
}

class PageVCFour: UIViewController {
    
    let startButtonTitle = "Начать использование"
    let nextButtonTitle = "Далее"
    let textColor = UIColor(rgb: 0x4FA6A0)
    let backgroundColor = UIColor(rgb: 0x4FA6A0)

    public weak var delegate: PageVCFourControllerDelegate?
    
    public var model = PageVCModelFour()
                         
    lazy var viewP: PageVCViewFour = {
        return PageVCViewFour(frame: self.view.frame)
    }()
    
    
    init() {
         super.init(nibName: nil, bundle: nil)
    }
            
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
        
    }

     override func viewDidLoad() {
         super.viewDidLoad()
         self.view = viewP
        
         viewP.setupSubviews(text7: model.text7, childName: model.childNameText, childDOB: model.childDOBText, childGender: model.childGenderText)
         viewP.layoutViews()
         setElementsSelectors()
        
         model.dateFormatter.dateFormat = "MM.dd.yyyy"
        
         let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
         viewP.addGestureRecognizer(hideKeyboardGesture)

    }
    
    func setElementsSelectors() {
        
        viewP.childDOBTextField.addTarget(self, action: #selector(self.childDOBEditBegin), for: .editingDidBegin)
        
       // viewP.childNameTextField.addTarget(self, action: #selector(self.childNameEditEnd), for: .editingDidEnd)

        viewP.boyButton.addTarget(self, action: #selector(self.boyButtonPressed), for: .touchUpInside)
        
        viewP.girlButton.addTarget(self, action: #selector(self.girlButtonPressed), for: .touchUpInside)

    }
    
    private func datePickerOnOff(isOn: Bool) {
        
        if isOn {
        let date = model.dateFormatter.date(from: viewP.childDOBTextField.text ?? "")
        
            
        viewP.datePicker.setDate(date ?? Date(), animated: true)
        viewP.childDOBTextField.inputView = viewP.datePicker
          
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
          
        viewP.toolBar.setItems([flexSpace, doneButton], animated: true)
        viewP.childDOBTextField.inputAccessoryView = viewP.toolBar
                  
        viewP.datePicker.addTarget(self, action: #selector(self.datePickerValueChanged(_:)), for: .valueChanged)
        
        viewP.setupDatePickerView()
        delegate?.setPickerView(view: viewP.datePicker)

        } else {
            
            viewP.endEditing(true)
        }
        
     }

    private func childGenderSwitch() {
        
        if model.childGender {
            
            viewP.boyButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            viewP.boyButton.setTitleColor(textColor, for: .normal)
            viewP.girlButton.backgroundColor = backgroundColor
            viewP.girlButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        } else {
            
            viewP.boyButton.backgroundColor = backgroundColor
            viewP.boyButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            viewP.girlButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            viewP.girlButton.setTitleColor(textColor, for: .normal)
        }
    }
    
    
/*    @objc private func childNameEditEnd() {
         // print("Датапикер показался")
        let name = viewP.childNameTextField.text
        if (name?.count ?? 0 > 0) && (name?.first != " ") {
            viewP.childNameTextField.text = " " + (name ?? "")
        }

         //datePickerOnOff(isOn: true)
      } */
    
    @objc private func childDOBEditBegin() {
       // print("Датапикер показался")

       datePickerOnOff(isOn: true)
    }
    
    @objc private func boyButtonPressed() {
     // print("Кнопка Мальчик нажата")
      model.childGender = true
      childGenderSwitch()

    }
    
    @objc private func girlButtonPressed() {
     // print("Кнопка Девочка нажата")
      model.childGender = false
      childGenderSwitch()
    }
    
    
    @objc func doneAction() {
        
        datePickerOnOff(isOn: false)
        viewP.childDOBTextField.text = (model.selectedDate)


       // view.endEditing(true)
      //  print("Датапикер спрятался")
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        
        model.selectedDate = model.dateFormatter.string(from: sender.date)
        viewP.childDOBTextField.text = (model.selectedDate)
       // print("Дата \(model.selectedDate) сохранена в текстовом поле")
    }
    
    
    @objc func hideKeyboard() {
        datePickerOnOff(isOn: false)
        //self.view.endEditing(true)
    }
    

     override func viewDidAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        
        let newButtonTitle = startButtonTitle
        
        delegate?.changeNextButtonTitle(text: newButtonTitle)
    
        model.lastPage = true
        
      //  print("Последнее окно открыто")
        
    }

     override func viewDidDisappear(_ anibmated: Bool) {

        let newButtonTitle = nextButtonTitle

        delegate?.changeNextButtonTitle(text: newButtonTitle)
        
        model.lastPage = false


        //print("Последнее окно закрыто")

        
    }
}
