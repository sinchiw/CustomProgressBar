//
//  ViewController.swift
//  CustomeAnimationCircle
//
//  Created by Wilmer sinchi on 11/26/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0;
    let shapeLayer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.gray

        //create track layer
        let trackLayer = CAShapeLayer()
        let center = view.center


         let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
//        trackLayer.backgroundColor = UIColor.white.cgColor
        trackLayer.strokeColor = UIColor.lightGray.cgColor

        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
//        trackLayer.strokeEnd = 0
        view.layer.addSublayer(trackLayer)



        /*you need the 2* so the line can go around the circk instead of 180*/
//        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.backgroundColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor

        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeEnd = 0

        view.layer.addSublayer(shapeLayer)

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handletap)))


    }

    @objc func handletap() {
       print("stroking")
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "Basic")

        }



}

