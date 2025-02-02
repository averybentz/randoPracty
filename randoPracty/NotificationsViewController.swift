//
//  NotificationsViewController.swift
//  randoPracty
//
//  Created by Avery Bentz on 2015-08-05.
//  Copyright (c) 2015 Avery Bentz. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var notificationsTableView: UITableView!
    
    var notifications = [NSString]()//Array for notifications
    var dates = [NSString]()//Array for notifications corresponding date
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Change nav bar colour
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.78039216, green: 0.81960784, blue: 0.84705882, alpha: 1)
        
        /****
         Retrieving current date
         ****/
         
        //Get current date when VC opens
        let date = NSDate()
        let formatter = NSDateFormatter()
        //Set formatter style to e.g.(Sunday, August 23, 2015)
        formatter.dateStyle = .FullStyle
        //Pass in current date
        let postDatePrint = formatter.stringFromDate(date)
        
        /****
         Adding initial notifications
         ****/
        
        //Add initial "wecloming" notification if not already saved
        if(userDefaults.objectForKey("notificationsKey") == nil){
            notifications.append("Welcome to Allert. Hopefully you enjoy our software! Please share with your friends!")
            
            //Add it to saved array via NSUserDefaults
            userDefaults.setObject(notifications, forKey: "notificationsKey")
            userDefaults.synchronize()
        }
        
        //Now that we can assure our desired object is not empty, we can set notifications array using it's corresponding NSUserDefaults key
        notifications = NSUserDefaults.standardUserDefaults().objectForKey("notificationsKey") as! [NSString]
        
        //Add initial, "welcoming" corresponding date if not already saved
        if(userDefaults.objectForKey("datesKey") == nil){
            dates.append(postDatePrint)
            
            //Add it to saved array via NSUserDefaults
            userDefaults.setObject(dates, forKey: "datesKey")
            userDefaults.synchronize()
        }
        
        //Now that we can assure our desired object is not empty, we can set notifications array using it's corresponding NSUserDefaults key
        dates = NSUserDefaults.standardUserDefaults().objectForKey("datesKey") as! [NSString]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = notificationsTableView.dequeueReusableCellWithIdentifier("notificationsCell") as! NotificationsTableViewCell
        
        //Set notificationsLabel of cells
        cell.notificationsLabel.text = notifications[indexPath.row] as String//notifications[indexPath.row] as? String
        //Set datesLabel of cells
        cell.datesLabel.text = dates[indexPath.row] as String
        
        return cell
    }
}
