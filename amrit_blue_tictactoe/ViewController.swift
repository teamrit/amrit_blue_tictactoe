//
//  ViewController.swift
//  amrit_blue_tictactoe
//
//  Created by Singh Singh on 2019-05-29.
//  Copyright © 2019 Singh Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var allSquares: [UIView]!
    @IBOutlet weak var orangeRectangle: UIView!
    
    @IBAction func Button(_ sender: UIButton) {
        // sender.titleEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
    }

    func addPanGesture(view : UIView) {
        let pan = UIPanGestureRecognizer(target: self
            , action: #selector(ViewController.handlePan(_:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
//        let fileView = sender.view
//        let translation = sender.translation(in: view)
//        print(sender.state)

            guard gestureRecognizer.view != nil else { return }
            
            if gestureRecognizer.state == .ended {      // Move the view down and to the right when tapped.
                let animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: {
                    gestureRecognizer.view!.center.x += 100
                    gestureRecognizer.view!.center.y += 100
                })
                animator.startAnimation()
            }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addPanGesture(view: orangeRectangle!)
        
        for square in allSquares
            print("SA")
        
    }


}

