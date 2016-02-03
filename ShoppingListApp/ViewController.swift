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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedRow = tableView.cellForRowAtIndexPath(indexPath)!
        
        if selectedRow.accessoryType == UITableViewCellAccessoryType.None {
            selectedRow.accessoryType = UITableViewCellAccessoryType.Checkmark
            selectedRow.tintColor = UIColor.blueColor()
        }else{
            selectedRow.accessoryType = UITableViewCellAccessoryType.None
        }//end of if else statement
    }//end of didselectfunction
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let deletedRow = tableView.cellForRowAtIndexPath(indexPath)!
        
        if editingStyle == UITableViewCellEditingStyle.Delete{
            items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            deletedRow.accessoryType=UITableViewCellAccessoryType.None
        }
    }

    @IBAction func addButton(sender: UIButton) {
        let newItem = textField.text
        items.append(newItem!)
        textField.resignFirstResponder()
        textField.text=""
        tableView.reloadData()
    }

}

