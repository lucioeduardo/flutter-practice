//
//  TodoAddViewController.swift
//  todolist
//
//  Created by eduardo on 07/10/22.
//

import UIKit

protocol AddTodoDelegate{
    func addTodo(todo: Todo)
}

class TodoAddViewController: UIViewController {

    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var deadlineTextField: UITextField!
    
    var delegate: AddTodoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addTodo(_ sender: Any) {
        guard let descr = descriptionTextField.text else {return}
        guard let deadline = deadlineTextField.text else {return}
                
        delegate?.addTodo(todo: Todo(description: descr, deadline: deadline))
        
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
