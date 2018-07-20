//
//  ViewController.swift
//  ToDoList
//
//  Created by David Hortsman on 7/19/18.
//  Copyright © 2018 David Hortsman. All rights reserved.
//

import UIKit
import CoreData

class InputViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    @IBAction func addItem(_ sender: UIButton) {
        if(inputText.text != ""){
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let newTask = TaskItem(context: context)
            newTask.taskName = inputText?.text
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            inputText.text = ""
            inputText.resignFirstResponder()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

