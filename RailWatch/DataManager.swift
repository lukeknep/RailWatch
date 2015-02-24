//
//  DataManager.swift
//  RailWatch
//
//  Created by Luke Knepper on 2/21/15.
//  Copyright (c) 2015 Luke Knepper. All rights reserved.
//

import Foundation

class DataManager {
	var rails: [String:[String]]
	
	var railsList: [String] {
		var list: [String] = []
		for railsName in rails.keys {
			list.append(railsName)
		}
		
		list.sort(<)
		
		return list
	}
	
	func saveData() {
		let userDefaults = NSUserDefaults.standardUserDefaults()
		userDefaults.setValue(rails, forKey: "rails")
	}
	
	func addStop(rails inRail: String, stop: String) {
		if var stops = rails[inRail] {
			stops.append(stop)
			rails[inRail] = stops
		}
		
		saveData()
	}
	
	init() {
		let userDefaults = NSUserDefaults.standardUserDefaults()
		if let railsInfo = userDefaults.valueForKey("rails") as? [String:[String]] {
			rails = railsInfo
		} else {
			// add default data
			rails = [
				"N": ["40th", "Motgomerry", "Embarcadero"],
				"NX" : ["Persian Cat", "Other thing"],
				"W" : ["Labrador Retriever"]
			]
		}
	}
	
	struct Static {
		static var onceToken : dispatch_once_t = 0
		static var instance : DataManager? = nil
	}
	
	class var sharedInstance : DataManager {
		dispatch_once(&Static.onceToken) {
			Static.instance = DataManager()
		}
		return Static.instance!
	}
}