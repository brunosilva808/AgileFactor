//
//  SettingsViewController.swift
//  Agile Factor
//
//  Created by Bruno Silva on 09/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

private let cellReuseIdentifier = "Cell"

class SettingsViewController: UITableViewController {
    
    let items = Array(arrayLiteral: Array(arrayLiteral: "Account".localized), Array(arrayLiteral: "Change Password".localized, "Change Pin Code".localized, "Logout"))
    
    // MARK: - Class Logic
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ViewHelper.setupNavBarTitle(navBar: navigationController!, navItem: navigationItem, view: view, title: "Settings".localized, aligment: .center)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
        
    override init(style: UITableViewStyle) {
        super.init(style: .grouped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: cellReuseIdentifier)
        
        let tmpItems = items[indexPath.section]
        cell.textLabel?.text = tmpItems[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if (section+1) == items.count {
            let tableViewFooter = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 25))
            let version = UILabel(frame: CGRect(x: 8, y: 5, width: tableView.frame.width, height: 30))
            version.font = version.font.withSize(14)
            
            if let stringVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
                version.text = "Version ".localized + "\(stringVersion)"
                version.textColor = UIColor.lightGray
                version.textAlignment = .center;
            }
            
            tableViewFooter.addSubview(version)
            
            return tableViewFooter
        }
        
        return nil
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                Swift.debugPrint("0")
            default:
                Swift.debugPrint("Debug")
            }
        case 1:
            switch indexPath.row {
            case 0:
                Swift.debugPrint("0")
            case 1:
                Swift.debugPrint("1")
            case 2:
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.presentPinViewController()
            default:
                Swift.debugPrint("Debug")
            }
        default:
            Swift.debugPrint("Debug")
        }
        
    }
    
}
