//
//  AddNewItemController.swift
//  ToDoList
//
//  Created by Chohee Kim on 10/22/16.
//  Copyright © 2016 Chohee Kim. All rights reserved.
//

import UIKit

protocol AddNewItemControllerDelegate: class {
    func addToDoItemToList(text:String)
}


class AddNewItemController: UIViewController {

    @IBOutlet weak var toDoItemTextField: UITextField!
    
    weak var delegate: AddNewItemControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func cancelBarButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveBarButtonPressed(_ sender: AnyObject) {
        delegate?.addToDoItemToList(text: toDoItemTextField.text!)
        self.dismiss(animated: true, completion: nil)
    }
}
