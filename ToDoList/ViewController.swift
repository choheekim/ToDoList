//
//  ViewController.swift
//  ToDoList
//
//  Created by Chohee Kim on 10/17/16.
//  Copyright © 2016 Chohee Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let toDoList: [Int:String] = [0: "Get groceries", 1: "Study CSC510 and BIO100", 2: "Eat Lunch"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self;
        tableView.dataSource = self;
    }


    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count ?? 0
        
    }
    
    
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
    }


}

