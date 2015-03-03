//
//  StopsViewController.swift
//  RailWatch
//
//  Created by Luke Knepper on 2/21/15.
//  Copyright (c) 2015 Luke Knepper. All rights reserved.
//

import UIKit

class StopsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	@IBOutlet var tableView: UITableView!
	var rail:String!
	
	var stops: [String] {
		return DataManager.sharedInstance.rails[rail]!
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return stops.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
		
		cell.textLabel?.text = stops[indexPath.row]
		cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
		
		return cell
	}
	
	func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
		if buttonIndex == 1 {
			// there is only one text field
			var textField = alertView.textFieldAtIndex(0)!
			
			// get the new races and capitalize the string
			var newStop = textField.text.capitalizedString
			
			// add the new race in the list
			DataManager.sharedInstance.addStop(rails: rail, stop: newStop)
			
			// create the index path for the last cell
			var newIndexPath = NSIndexPath(forRow: stops.count - 1, inSection: 0)
			
			// insert the new cell in the table view and show an animation
			tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
		}
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
				title = rail
			
				tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
