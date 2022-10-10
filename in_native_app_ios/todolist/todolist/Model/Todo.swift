//
//  Todo.swift
//  todolist
//
//  Created by eduardo on 07/10/22.
//

import UIKit

class Todo: NSObject {
    let descr: String
    let deadline: String
    
    init(description: String, deadline: String){
        self.descr = description
        self.deadline = deadline
    }
}
