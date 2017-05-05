//
//  ViewController.swift
//  GestureDemo-Swift3
//  Copyright © 2017 iOSDevCenters. All rights reserved.
//

import UIKit

class ViewController: UIViewController  , UIGestureRecognizerDelegate , UITextFieldDelegate{
    
    @IBOutlet weak var viewRotate: UIView!
    var lastRotation   = CGFloat()
    var rotateGesture  = UIRotationGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        //ROTATE Gesture
        rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.rotatedView(_:)))
        viewRotate.addGestureRecognizer(rotateGesture)
        viewRotate.isUserInteractionEnabled = true
        viewRotate.isMultipleTouchEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rotatedView(_ sender : UIRotationGestureRecognizer){
        var lastRotation = CGFloat()
        self.view.bringSubview(toFront: viewRotate)
        if(sender.state == UIGestureRecognizerState.ended){
            lastRotation = 0.0;
        }
        let rotation = 0.0 - (lastRotation - sender.rotation)
       // var point = rotateGesture.location(in: viewRotate)
        let currentTrans = sender.view?.transform
        let newTrans = currentTrans!.rotated(by: rotation)
        sender.view?.transform = newTrans
        lastRotation = sender.rotation
    }

}

