//
//  ViewController.swift
//  EfectImage01
//
//  Created by fujic on 2015/05/12.
//  Copyright (c) 2015年 Yapp. All rights reserved.
//

import UIKit

protocol MyDelegate: class {
    func didTappedButton()
}
class ViewController: UIViewController {

    var imageData:UIImage?
    var flg:Bool?
    
    var prevScale: CGFloat?

    override func viewDidLoad() {
        super.viewDidLoad()
        flg=false
        //前回のスケールを保存する　初期化
        prevScale = 1.0
        //imageData = UIImage(named: "Brain-Bulb1.jpg")
        // Do any additional setup after loading the view, typically from a nib.

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func pinchground(sender: UITapGestureRecognizer) {
        println("---- Hoge  ----")
    }

//    @IBAction func doubleTapImage(sender: UITapGestureRecognizer) {
//        println("DoubleTap ここでは楽しいかい")
//        
//        var view = sender.view
//        var imageAffine = view as? UIImageView
//        imageAffine?.transform = CGAffineTransformMakeScale(3.0, 3.0)
//    }
   
    //ピンチ操作に対して拡大縮小する
    @IBAction func pinchImage(sender: UIPinchGestureRecognizer) {
        println("scale: \(sender.scale)")
        if(sender.state == UIGestureRecognizerState.Began){
            //前回のスケールに設定する。
            sender.scale = prevScale!
        }else if( sender.state == UIGestureRecognizerState.Changed){
            //スケールに合わせて拡大縮小する
            ImageView.transform = CGAffineTransformMakeScale(sender.scale, sender.scale)
        }else if(sender.state == UIGestureRecognizerState.Ended){
            prevScale = sender.scale
        }
    }
    
    @IBOutlet weak var ImageView: UIImageView!
    
    
    @IBAction func ConvertImage(sender: AnyObject) {
        if(self.flg == false){
            var MyImage = ImageView.image
            self.imageData  = ImageView.image
            var egeimage = EfectOpenCV.DetectEdgeWithImage(MyImage!)
            ImageView.image = egeimage
            self.flg = true
        }else{
            self.flg = false
            ImageView.image = imageData
        }
        /*
        var image = imageView.image;
        var edge = TestOpenCV.DetectEdgeWithImage(image);
        imageView.image = edge as UIImage;
        */
    }

}

