//
//  DataViewController.swift
//  PracticeExamples
//
//  Created by Evgeny Karev on 23.04.2018.
//  Copyright © 2018 Evgeny Karev. All rights reserved.
//

import UIKit


class DataViewController: UIViewController {
    
    var textData: String? {
        didSet {
            dataLabel.text = textData
        }
    }
    
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBAction func dataEditButtonTouchUpInside(_ sender: Any) {
        performSegue(withIdentifier: "dataEdit", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textData = "Data example"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "dataEdit":
            guard let controller = segue.destination as? DataEditViewController else {
                return
            }
            
            controller.data = self.textData
            controller.dataEditHandler = { [weak self] (data) in
                self?.textData = data
            }
            controller.delegate = self
        default:
            break
        }
    }

}

extension DataViewController: DataEditViewControllerDelegate {
    
    func dataEditViewController(_ controller: DataEditViewController, didSave data: String) {
        self.textData = data
    }

}
