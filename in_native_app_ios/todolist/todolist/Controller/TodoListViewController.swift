//
//  TodoListViewController.swift
//  todolist
//
//  Created by eduardo on 07/10/22.
//

import UIKit
import Flutter

class TodoListViewController: UITableViewController, AddTodoDelegate {
    
    
    
    var todos: [Todo] = [
        Todo(description: "Todo teste", deadline: "01/01/2023")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.descr
        
        let press = UITapGestureRecognizer(target: self, action: #selector(openFlutter(_ :)))
        cell.addGestureRecognizer(press)
        
        return cell
    }
    
    @objc func openFlutter(_ gesture: UITapGestureRecognizer){
        guard let cell = gesture.view as? UITableViewCell else {return}
        guard let index = tableView.indexPath(for: cell)?.row else {return}
    
        
        guard let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine else {return}
        let flutterViewController = FlutterCounterController(engine: flutterEngine, todo: todos[index])
                
        navigationController?.pushViewController(flutterViewController, animated: true)
    }
    
    func addTodo(todo: Todo) {
        todos.append(todo)
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? TodoAddViewController {
            viewController.delegate = self
        }
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
