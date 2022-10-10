//
//  AddTodoViewController.swift
//  todolist
//
//  Created by eduardo on 07/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addTodo(_ sender: Any) {
        guard let description = descriptionTextField.text else {return}
        
        print("Adding todo \(description)")
    }
    
}

