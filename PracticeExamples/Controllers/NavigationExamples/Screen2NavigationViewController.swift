//
//  Screen2NavigationController.swift
//  PracticeExamples
//
//  Created by Evgeny Karev on 18.04.2018.
//  Copyright © 2018 Evgeny Karev. All rights reserved.
//

import Foundation
import UIKit

class Screen2NavigationViewController: UIViewController {
    
    @IBAction func goToScreen3ButtonTouchUpInside(_ sender: Any) {
        self.performSegue(withIdentifier: "screen3Navigation", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Perform segue \(segue.identifier ?? "unknown")")
    }
    
}
