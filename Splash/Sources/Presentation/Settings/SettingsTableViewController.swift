//
//  SettingsTableViewController.swift
//  Splash
//
//  Created by Ivan Glushko on 03/04/2018.
//  Copyright © 2018 ivanglushko. All rights reserved.
//

import UIKit
import ChameleonFramework

class SettingsTableViewController: UITableViewController {
    private let presenter = SettingsPresenter()
    var output: SettingsViewOutput {
        let presenter = SettingsPresenter()
        presenter.view = self
        return presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .paleGreen
        tableView.rowHeight = 70.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    @IBAction private func addLink(_ sender: UIBarButtonItem) {
        buildAddAlert()
    }
    @IBAction private func deleteAllUrls(_ sender: UIBarButtonItem) {
        buildDeleteAllUrlsAlert()
    }
}


// MARK: - TableViewDataSource
extension SettingsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(output.numberOfRows())
        return output.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return { setCells(indexPath: indexPath) }()
    }
    // MARK: - TableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.tapLink(with: indexPath.row)
    }

}

extension SettingsTableViewController {
    func setCells(indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = output.url(for: indexPath)
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        if indexPath.row == 0 {
            cell.backgroundColor = FlatGreen()
        }
        return cell
    }
    
}

extension SettingsTableViewController: SettingsViewInput {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}
