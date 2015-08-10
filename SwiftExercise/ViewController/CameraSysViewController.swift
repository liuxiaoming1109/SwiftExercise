//
//  CameraSysViewController.swift
//  SwiftExercise
//
//  Created by liuxm on 15/8/7.
//  Copyright (c) 2015年 evan. All rights reserved.
//

import UIKit

 /// 调用系统照相机

class CameraSysViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 系统相册
    @IBAction func jumpSysPhotoBtn(sender: AnyObject) {
        var picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(picker, animated: true, completion: nil)
    }
   
    // 系统相机
    @IBAction func jumpSysCameraBtn(sender: AnyObject) {
        var sourceType = UIImagePickerControllerSourceType.Camera
        // 判断有没有相机
        if !UIImagePickerController.isSourceTypeAvailable(sourceType) {
            sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        var picker = UIImagePickerController()
        picker.delegate = self
        picker.editing = true
        picker.sourceType = sourceType
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    // 自定义相册
    @IBAction func jumpCustomPhotoBtn(sender: AnyObject) {
        
    }
    
    // 自定义相机
    @IBAction func jumpCustomCameraBtn(sender: AnyObject) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 选择照片后调用
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        print(info)
        var image = info[UIImagePickerControllerOriginalImage] as? UIImage
        photoImageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // cancel点击后跳用
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
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
