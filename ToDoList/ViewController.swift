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
    
    var toDoList: NSMutableArray = []
    
    var completedToDoList: [Int:String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resetAccessoryType()
        tableView.reloadData()
    }


    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count ?? 0
        
    }
    
    
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        cell.textLabel?.text = toDoList[indexPath.row] as! String
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func resetAccessoryType() {
        for row in 0..<toDoList.count {
            if let cell = tableView.cellForRow(at: IndexPath(row:row, section:0)) {
                cell.accessoryType = .none
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
                completedToDoList[completedToDoList.count] = toDoList[indexPath.row] as? String
                toDoList.removeObject(at: indexPath.row)
            }else {
                cell.accessoryType = .none
            }
        }
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
        }else if(segue.identifier == "CompletedItemSegue") {
            let completedToDoItemsController = segue.destination as! CompletedToDoItemsController
            completedToDoItemsController.completedToDoList = completedToDoList 
            
        }
        
    }
}

