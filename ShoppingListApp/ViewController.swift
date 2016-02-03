//
//  ViewController.swift
//  ShoppingListApp
//
//  Created by Sarah-Jessica Jemitola on 03/02/2016.
//  Copyright © 2016 Tobi and Sons. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor=UIColor.redColor()
        return cell
    }

    @IBAction func addButton(sender: UIButton) {
        let newItem = textField.text
        items.append(newItem!)
        textField.resignFirstResponder()
        textField.text=""
        tableView.reloadData()
    }

}

