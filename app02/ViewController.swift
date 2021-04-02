//
//  ViewController.swift
//  app02
//
//  Created by developer on 04.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView?
    @IBOutlet var speedField: UITextField?
    @IBOutlet var btnRotation: UIButton?
    
    var isRotating = true
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let centerX = UIScreen.main.bounds.width / 2
        let centerY = UIScreen.main.bounds.height / 2
        imgView?.center.x = centerX
        imgView?.center.y = centerY
    }
    
    var angle: Float = 0.0
    
    @objc func calcRotation() {
        if angle == 360 {
            angle = 0
        }
        
        let sizeScreeen = UIScreen.main.bounds
        let centerX = sizeScreeen.width / 2
        let centerY = sizeScreeen.height / 2
        
        let speedStr: String? = speedField?.text
        if let speedStr = speedStr, let speed = Float(speedStr) {
            let radius: CGFloat = 100.0
            let cosValue = CGFloat(cos(angle * .pi / 180))
            let sinValue = CGFloat(sin(angle * .pi / 180))
            imgView?.center.x = radius * cosValue + centerX
            imgView?.center.y = radius * sinValue + centerY
            
            angle += 5 * speed
        }
    }

    @IBAction func doRotation() {
        if isRotating == true {
            btnRotation?.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(calcRotation), userInfo: nil, repeats: true)
            
        } else {
            btnRotation?.setTitle("Start", for: .normal)
            timer.invalidate()
        }
        isRotating = !isRotating
    }

}

