//
//  FlutterCounterController.swift
//  todolist
//
//  Created by eduardo on 10/10/22.
//

import UIKit
import Flutter

class FlutterTodoDetailController: FlutterViewController {
    
    var channel: FlutterMethodChannel?
    var todo: Todo?
    
    init(engine: FlutterEngine, todo: Todo){
        super.init(engine: engine, nibName: nil, bundle: nil)
        self.todo = todo
        
        channel = FlutterMethodChannel(name: "test_channel", binaryMessenger: self.binaryMessenger)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        channel?.invokeMethod("setTodo", arguments: ["description": todo?.descr, "deadline": todo?.deadline])
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
