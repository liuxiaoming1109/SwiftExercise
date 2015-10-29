//
//  ComponentsViewController.swift
//  SwiftExercise
//
//  Created by liuxm on 15/10/29.
//  Copyright © 2015年 evan. All rights reserved.
//

import UIKit

class ComponentsViewController: UIViewController {
    
    var hudView:SAMHUDView!
    
    // 固定比例
    @IBOutlet weak var circleProgressView: SAMCircleProgressView!
    // 不停变化比例
    @IBOutlet weak var circleChangProgressView: SAMCircleProgressView!
    // 让圆比例不停变化时间
    var circleChangTimer:NSTimer!

    @IBOutlet weak var rateLimitLabel: UILabel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init() {
        let nibNameOrNil = String?("ComponentsViewController")
        self.init(nibName: nibNameOrNil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 设置圆的比例
        circleProgressView.progress = 0.35
        circleProgressView.borderWidth = 3.0
        
        circleChangProgressView.progress = 0
        circleChangProgressView.fillColor = UIColor.redColor()
        circleChangProgressView.innerBorderColor = UIColor.greenColor()
        circleChangTimer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "incrementProgress:", userInfo: nil, repeats: true)
        
        // RateLimit
        RateLimit.execute(name: "RefreshTimeline", limit: 60) { () -> () in
            rateLimitLabel.text = NSDate().description
        }
    }
    
    // loading成功
    @IBAction func loadingBtn(sender: AnyObject) {
//        let hudView = SAMHUDView(title: "Loading...")
        hudView = SAMHUDView(title: "Loading...", loading: true)
        hudView.show()
        
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "dismissLoadingSuccess:", userInfo: nil, repeats: false)
    }
    
    // loading失败
    @IBAction func loadingFailedBtn(sender: AnyObject) {
        hudView = SAMHUDView(title: "Loading...", loading: true)
        hudView.show()
        
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "dismissLoadingFailed:", userInfo: nil, repeats: false)
    }
    
    // loading成功
    func dismissLoadingSuccess(timer:NSTimer) {
        hudView.completeAndDismissWithTitle("Success")
    }
    
    // loading失败
    func dismissLoadingFailed(timer:NSTimer) {
        hudView.failAndDismissWithTitle("Failed")
    }
    
    func incrementProgress(timer:NSTimer) {
        circleChangProgressView.progress = circleChangProgressView.progress + 0.01
        if circleChangProgressView.progress == 1.0 {
            circleChangProgressView.progress = 0.0
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
