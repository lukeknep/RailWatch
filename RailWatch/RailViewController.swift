//
//  ViewController.swift
//  RailWatch
//
//  Created by Luke Knepper on 2/21/15.
//  Copyright (c) 2015 Luke Knepper. All rights reserved.
//

import UIKit

class RailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	@IBOutlet
	var tableView: UITableView!
	
	var items:[String] = ["Hey", "Bethany", "I", "Love", "You"]
	
	var rails: [String] = DataManager.sharedInstance.railsList

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		title = "Your Stations"
		
		self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return rails.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
		
		cell.textLabel?.text = self.rails[indexPath.row]
		cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
		
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
		
		var stopsViewController = storyboard?.instantiateViewControllerWithIdentifier("StopsViewController") as StopsViewController
		
		stopsViewController.rail = rails[indexPath.row]
		
		navigationController?.pushViewController(stopsViewController, animated: true)
	}
}

