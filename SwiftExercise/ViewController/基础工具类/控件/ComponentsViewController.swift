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
