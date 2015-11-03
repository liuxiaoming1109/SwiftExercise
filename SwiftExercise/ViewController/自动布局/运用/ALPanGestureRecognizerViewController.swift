//
//  ALPanGestureRecognizerViewController.swift
//  SwiftExercise
//
//  Created by liuxm on 15/10/30.
//  Copyright © 2015年 evan. All rights reserved.
//


import UIKit

 /// AutoLayout 手势

class ALPanGestureRecognizerViewController: UIViewController {
    
    var middleViewTopSpacelayoutConstant:CGFloat!
    var middleViewOriginY:CGFloat!
    
    @IBOutlet weak var middleView: UIView!
    // middleView距离最上部的高度
    @IBOutlet weak var middleViewTopSpaceLayout: NSLayoutConstraint!
    // 手势控件
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    
    
    convenience init() {
        let nibNameOrNil = String?("ALPanGestureRecognizerViewController")
        self.init(nibName: nibNameOrNil, bundle:nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        panGesture.addTarget(self, action: "pan")
        middleViewTopSpacelayoutConstant = middleViewTopSpaceLayout.constant
        middleViewOriginY = middleView.frame.origin.y
    }
    
    func pan() {
        if panGesture.state == UIGestureRecognizerState.Ended {
            UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.middleView.frame.origin.y = self.middleViewOriginY
                }, completion: { (success) -> Void in
                    if success {
                        self.middleViewTopSpaceLayout.constant = self.middleViewTopSpacelayoutConstant
                    }
            })
            return
        }
        let y = panGesture.translationInView(self.view).y
        middleViewTopSpaceLayout.constant = middleViewTopSpacelayoutConstant + y
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
