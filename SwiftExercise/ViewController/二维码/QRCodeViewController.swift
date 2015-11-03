//
//  QRCodeViewController.swift
//  SwiftExercise
//
//  Created by liuxm on 15/11/3.
//  Copyright © 2015年 evan. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet weak var scanView: UIView!
    @IBOutlet weak var scanReturnLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    var boxView:UIView!
    var isReading:Bool!
    var scanLayer:CALayer!
    
    var captureSession:AVCaptureSession!
    var videoPreviewLayer:AVCaptureVideoPreviewLayer!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init() {
        let nibNameOrNil = String?("QRCodeViewController")
        self.init(nibName: nibNameOrNil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        captureSession = nil
        isReading = false
    }
    
    func startReading() ->Bool {
        //1.初始化捕捉设备（AVCaptureDevice），类型为AVMediaTypeVideo
        let captureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        //2.用captureDevice创建输入流
        let input = try? AVCaptureDeviceInput(device: captureDevice)
        if input == nil {
            return false
        }
        
        //3.创建媒体数据输出流
        let captureMetadataOutput = AVCaptureMetadataOutput()
        
        //4.实例化捕捉会话
        captureSession = AVCaptureSession()
        
        //4.1.将输入流添加到会话
        captureSession.addInput(input)
        
        //4.2.将媒体输出流添加到会话中
        captureSession.addOutput(captureMetadataOutput)
        
        //5.创建串行队列，并加媒体输出流添加到队列当中
        var dispatchQueue:dispatch_queue_t
        dispatchQueue = dispatch_queue_create("myQueue", nil)
        
        //5.1.设置代理
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: dispatchQueue)
        
        //5.2.设置输出媒体数据类型为QRCode
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        
        //6.实例化预览图层
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        //7.设置预览图层填充方式
        videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        //8.设置图层的frame
        videoPreviewLayer.frame = scanView.layer.bounds
        
        //9.将图层添加到预览view的图层上
        scanView.layer.addSublayer(videoPreviewLayer)
        
        //10.设置扫描范围
        captureMetadataOutput.rectOfInterest = CGRectMake(0.2, 0.2, 0.8, 0.8)
        
        //10.1.扫描框
        boxView = UIView(frame: CGRectMake(scanView.bounds.size.width * 0.2, scanView.bounds.size.height * 0.2, scanView.bounds.size.width - scanView.bounds.size.width * 0.4, scanView.bounds.size.height - scanView.bounds.size.height * 0.4))
        
        boxView.layer.borderColor = UIColor.redColor().CGColor
        boxView.layer.borderWidth = 1.0
        
        scanView.addSubview(boxView)
        
        //10.2.扫描线
        scanLayer = CALayer()
        scanLayer.frame = CGRectMake(0, 0, boxView.bounds.size.width, 1)
        scanLayer.backgroundColor = UIColor.brownColor().CGColor
        
        boxView.layer.addSublayer(scanLayer)
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "moveScanLayer:", userInfo: nil, repeats: true)
        
        timer.fire()
        
        captureSession.startRunning()
        
        return true
    }
    
    @IBAction func startStopScanBtn(sender: AnyObject) {
        if (isReading != nil && !isReading) {
            if startReading() {
                startButton.setTitle("停止", forState: UIControlState.Normal)
                scanReturnLabel.text = "扫描二维码"
            }
        } else {
            stopReading()
            startButton.setTitle("开始", forState: UIControlState.Normal)
        }
        isReading = !isReading
    }
    
    func stopReading() {
        if captureSession != nil {
            captureSession.stopRunning()
            captureSession = nil
        }

        if scanLayer != nil {
            scanLayer.removeFromSuperlayer()
        }
        
        if videoPreviewLayer != nil {
            videoPreviewLayer.removeFromSuperlayer()
        }
        
        if boxView != nil {
            boxView.removeFromSuperview()
        }
        
        startButton.setTitle("开始", forState: UIControlState.Normal)
    }
    
    // AVCaptureMetadataOutputObjectsDelegate代理
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        //判断是否有数据
        if (metadataObjects != nil && metadataObjects.count > 0) {
            let metaDataObj = metadataObjects[0]
            
             //判断回传的数据类型
            if metaDataObj.type == AVMetadataObjectTypeQRCode {
                scanReturnLabel.performSelectorOnMainThread("setText:", withObject: metaDataObj.stringValue, waitUntilDone: false)
                
                self.performSelectorOnMainThread("stopReading", withObject: nil, waitUntilDone: false)
                isReading = false
            }
        }
    }
    
    func moveScanLayer(timer:NSTimer) {
        var frame = scanLayer.frame
        if boxView.frame.size.height < scanLayer.frame.origin.y {
            frame.origin.y = 0
            scanLayer.frame = frame
        } else {
            frame.origin.y += 5
            
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.scanLayer.frame = frame
            })
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
