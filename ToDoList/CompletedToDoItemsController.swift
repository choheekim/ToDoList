//
//  CompletedToDoItemsController.swift
//  ToDoList
//
//  Created by Chohee Kim on 10/22/16.
//  Copyright © 2016 Chohee Kim. All rights reserved.
//

import UIKit

class CompletedToDoItemsController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var completedToDoList: [Int:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completedToDoList.count ?? 0
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompletedToDoItemCell", for: indexPath)
        cell.textLabel?.text = completedToDoList[indexPath.row]
        
        return cell
    }
}
