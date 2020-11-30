//
//  CustomMenu.swift
//  DemoBrowser
//
//  Created by Vlad on 30.11.2020.
//

import Foundation
import UIKit

class CustomMenu:UIViewController{
    
    private let tableViewMenu = UITableView()
    
    private let arr = ["item1","item2","item3","item4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewMenu.register(UITableViewCell.self, forCellReuseIdentifier: "CellMenu")
        
        tableViewMenu.delegate = self
        tableViewMenu.dataSource = self
        
        view.addSubview(tableViewMenu)

        tableViewMenu.translatesAutoresizingMaskIntoConstraints = false
        
        tableViewMenu.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableViewMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableViewMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableViewMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension CustomMenu:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellMenu", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    
    
}
