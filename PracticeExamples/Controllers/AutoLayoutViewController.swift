//
//  ViewController.swift
//  ConstraintMovingPractice
//
//  Created by Evgeny Karev on 11.04.2018.
//  Copyright © 2018 Evgeny Karev. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {
    
    private var centerViewLeading: CGFloat!
    
    @IBOutlet var menuButton: UIButton!
    @IBOutlet var menuLabel: UILabel!
    @IBOutlet var menuView: UIView!
    @IBOutlet var menuHeightExpandedConstraint: NSLayoutConstraint!
    @IBOutlet weak var centerViewLeadingConstraint: NSLayoutConstraint!
    
    @IBAction func menuBootonTapped(_ sender: Any) {
        isMenuExpanded = !isMenuExpanded
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let screenWidth = UIScreen.main.bounds.width
        let maxCenterViewLeading = (screenWidth / 2) - (centerViewLeading * 2)
        
        centerViewLeadingConstraint.constant = centerViewLeading + (maxCenterViewLeading * (CGFloat(1 - sender.value)))
        view.layoutIfNeeded()
    }
    
    private var isMenuExpanded: Bool = true {
        didSet {
            guard oldValue != isMenuExpanded else { return }
            
            menuHeightExpandedConstraint.isActive = isMenuExpanded
            let menuButtonTransform: CGAffineTransform
            if isMenuExpanded {
                menuButtonTransform = CGAffineTransform.identity
            } else {
                menuButtonTransform = CGAffineTransform.init(rotationAngle: CGFloat.pi - 0.000001)
            }
            let menuLabelAlpha: CGFloat = isMenuExpanded ? 1 : 0
            
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
                self.menuLabel.alpha = menuLabelAlpha
                self.menuButton.transform = menuButtonTransform
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerViewLeading = centerViewLeadingConstraint.constant
        
        menuButton.layer.cornerRadius = 22
        menuButton.layer.masksToBounds = false
        menuButton.layer.shadowColor = UIColor.black.cgColor
        menuButton.layer.shadowOpacity = 0.3
        menuButton.layer.shadowRadius = 3
        menuButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        menuView.layer.masksToBounds = false
        menuView.layer.shadowColor = UIColor.black.cgColor
        menuView.layer.shadowOpacity = 0.3
        menuView.layer.shadowRadius = 2
        menuView.layer.shadowOffset = CGSize(width: 0, height: -2)
    }

}

