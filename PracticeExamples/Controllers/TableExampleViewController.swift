//
//  TableExampleViewController.swift
//  PracticeExamples
//
//  Created by Evgeny Karev on 25.04.2018.
//  Copyright © 2018 Evgeny Karev. All rights reserved.
//

import UIKit

class TableExampleViewController: UIViewController {
    
    var rows: [String] = ["First line", "Second line with very long content", "Third line"]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButtonTapped(_ sender: Any) {
        rows.append("New line")
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(cellClass: TableViewExampleCell.self)
    }
    
}

extension TableExampleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat.leastNormalMagnitude
        } else {
            return 22
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TableExampleViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 22
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewExampleCell = tableView.dequeueReusableCell(for: indexPath)
        
        cell.update(title: rows[indexPath.row])
        if indexPath.row % 3 == 0 {
            cell.contentView.backgroundColor = UIColor.gray
        }
        return cell
    }
}
