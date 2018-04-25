//
//  DataEditViewController.swift
//  PracticeExamples
//
//  Created by Evgeny Karev on 23.04.2018.
//  Copyright © 2018 Evgeny Karev. All rights reserved.
//

import UIKit

protocol DataEditViewControllerDelegate: class {
    func dataEditViewController(_ controller: DataEditViewController, didSave data: String)
}

class DataEditViewController: UIViewController {
    
    var data: String?
    
    var dataEditHandler: ((String) -> Void)?
    weak var delegate: DataEditViewControllerDelegate?
    
    @IBOutlet weak var dataEditTextField: UITextField!
    
    func saveDataAndClose() {
        if let handler = self.dataEditHandler {
            handler(dataEditTextField.text ?? "")
        }
        delegate?.dataEditViewController(self, didSave: dataEditTextField.text ?? "")
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dataSaveButtonTouchUpInside(_ sender: Any) {
        saveDataAndClose()
    }
    
    deinit {
        print("DataEditViewController deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataEditTextField.text = data ?? ""
        dataEditTextField.becomeFirstResponder()
    }
    
}

extension DataEditViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveDataAndClose()
        return true
    }
    
}
