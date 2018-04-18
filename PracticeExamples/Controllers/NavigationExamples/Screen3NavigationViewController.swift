//
//  Screen3NavigationViewController.swift
//  PracticeExamples
//
//  Created by Evgeny Karev on 18.04.2018.
//  Copyright © 2018 Evgeny Karev. All rights reserved.
//

import Foundation
import UIKit

class Screen3NavigationViewController: UIViewController {
    
    private var isModalPresented: Bool! {
        didSet {
            let title = isModalPresented ? "Close" : "Remove screen 2"
            actionButton.setTitle(title, for: .normal)
            if !isModalPresented {
                view.backgroundColor = UIColor.white
            }
        }
    }
    
    @IBOutlet weak var actionButton: UIButton!
    
    private func removeSecondScreenFromNavigationStack() {
        guard let navigationController = self.navigationController else { return }
        guard navigationController.viewControllers.count > 2 else { return }
        
        navigationController.viewControllers.remove(at: 1)
    }
    
    @IBAction func actionButtonTouchUpInside(_ sender: Any) {
        if isModalPresented {
            self.dismiss(animated: true)
        } else {
            removeSecondScreenFromNavigationStack()
            if (navigationController?.viewControllers.count ?? 0) <= 2 {
                UIView.animate(withDuration: 0.3, animations: {
                    self.actionButton.alpha = 0
                }) { (_) in
                    self.actionButton.isHidden = true
                }
            }
        }
    }
    
    override func viewDidLoad() {
        isModalPresented = navigationController == nil
    }
    
}
