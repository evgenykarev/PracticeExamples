//
//  TableViewExampleCell.swift
//  PracticeExamples
//
//  Created by Evgeny Karev on 25.04.2018.
//  Copyright © 2018 Evgeny Karev. All rights reserved.
//

import UIKit

class TableViewExampleCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    func update(title: String) {
        titleLabel.text = title
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        contentView.backgroundColor = UIColor.white
        titleLabel.text = nil
    }
    
}
