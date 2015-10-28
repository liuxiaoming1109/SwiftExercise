//
//  ImageTableViewController.swift
//  SwiftExercise
//
//  Created by liuxm on 15/8/7.
//  Copyright (c) 2015年 evan. All rights reserved.
//

import UIKit

 /// tableview 显示图片

class ImageTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "图片显示"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reuseIdentifier")
        }
        
        cell!.backgroundView = UIImageView(image: UIImage(named:"Photo_SelImage" + String(indexPath.row + 1)))
        cell!.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let heigth:CGFloat = CGRectGetWidth(self.view.frame)/1080*495
        return heigth
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
