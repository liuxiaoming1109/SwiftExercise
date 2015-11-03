//
//  AutoLayoutViewController.swift
//  SwiftExercise
//
//  Created by liuxm on 15/10/30.
//  Copyright © 2015年 evan. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var list:NSArray = ["基础 - AutoLayout","基础 - AutoLayoutTableViewCell","运用 - ALPanGestureRecognizer",""]
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reuseIdentifier")
        }
        
        cell!.textLabel?.text = self.list.objectAtIndex(indexPath.row) as? String
        
        cell?.backgroundColor = Constants.kAPPViewColor
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(AutoLayoutExercise1ViewController(), animated: true)
        case 1:
            self.navigationController?.pushViewController(AutoLayoutTableViewController(), animated: true)
        case 2:
            self.navigationController?.pushViewController(ALPanGestureRecognizerViewController(), animated: true)
        default:
            break
        }
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
