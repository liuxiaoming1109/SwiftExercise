//
//  HomeTableViewController.swift
//  SwiftExercise
//
//  Created by liuxm on 15/8/6.
//  Copyright (c) 2015年 evan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var list:NSArray = {["TableView显示图片", "相机－相册","基础工具类","自动布局","二维码"]}()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return list.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reuseIdentifier")
        }
        
        cell?.backgroundColor = Constants.kAPPViewColor
        
        cell!.textLabel?.text = self.list.objectAtIndex(indexPath.row) as? String

        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        // 系统相册
        case 0:
            let imageViewControllerJump: ImageTableViewController
            = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ImageTableViewControllerID") as! ImageTableViewController
            self.navigationController?.pushViewController(imageViewControllerJump, animated: true)
        // 系统相机
        case 1:
            let camSysViewControllerJump:CameraSysViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CameraSysViewControllerID") as! CameraSysViewController
            self.navigationController?.pushViewController(camSysViewControllerJump, animated: true)
        // 基础工具类
        case 2:
            let toolkitViewControllerump:SSToolkitViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SSToolkitViewController") as! SSToolkitViewController
            self.navigationController?.pushViewController(toolkitViewControllerump, animated: true)
        // 自动布局
        case 3:
            let autoLayoutViewController:AutoLayoutViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AutoLayoutViewController") as! AutoLayoutViewController
            self.navigationController?.pushViewController(autoLayoutViewController, animated: true)
        // 二维码
        case 4:
            self.navigationController?.pushViewController(QRCodeViewController(), animated: true)
        default:
            break
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
