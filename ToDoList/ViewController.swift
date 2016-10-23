//
//  ViewController.swift
//  ToDoList
//
//  Created by Chohee Kim on 10/17/16.
//  Copyright © 2016 Chohee Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddNewItemControllerDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var toDoList: [Int:String] = [:]

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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func addToDoItemToList(text: String) {
        toDoList[toDoList.count] = text
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

        if(segue.identifier == "AddToDoItemSegue") {
            let navigationController = segue.destination as! UINavigationController
            let addToDoViewController = navigationController.topViewController as! AddNewItemController
            
            addToDoViewController.delegate = self
        }
        
    }
}

