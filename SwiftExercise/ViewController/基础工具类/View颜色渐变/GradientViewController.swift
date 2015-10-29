//
//  GradientViewController.swift
//  SwiftExercise
//
//  Created by liuxm on 15/10/29.
//  Copyright © 2015年 evan. All rights reserved.
//

import UIKit

class GradientViewController: UIViewController {
    
    @IBOutlet weak var gradientView: GradientView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init() {
        let nibNameOrNil = String?("GradientViewController")
        self.init(nibName: nibNameOrNil, bundle:nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "颜色渐变"
        self.navigationController?.navigationBar.topItem?.title = "返回"
        
        gradientView.colors = [UIColor.whiteColor(), UIColor(red: 0, green: 0, blue: 0.5, alpha: 1)]

        
//        gradientView.colors = [UIColor.blackColor(), UIColor.redColor()]
        
        // Do any additional setup after loading the view.
    }

    @available(iOS 8.0, *)
    @IBAction func showAlertBtn(sender: AnyObject) {
        let alert = UIAlertController(title: "Dimming", message: "As part of iOS 7 design language, views should become desaturated when an alert view appears.", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Awesome", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
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
