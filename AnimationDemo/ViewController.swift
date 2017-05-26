//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Higher Visibility on 24/05/2017.
//  Copyright © 2017 HigherVisibility. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
   var myview = UIView()
   var sideViewPresent = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
       self.presentSideView()
       self.myview.backgroundColor = UIColor.black
       self.view.addSubview(self.myview)
    
        self.addTabGestureOnView()
        self.addTabGestureOnSuperView()
 
    }

    private func presentSideView(){
        
        let x = self.view.frame.size.width - 50
        let viewWidth = self.view.frame.size.width - 55
        let viewHeight = self.view.frame.size.height - 50
        self.myview.frame = CGRect(x: x, y: 20, width: viewWidth, height: viewHeight)
        let xibView = Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)
        let main = xibView?[0] as! UIView
        main.frame.size = self.myview.frame.size
        self.myview.addSubview(main)
        
    }
    
    private func addTabGestureOnSuperView(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.movesideView(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
        
    }

    func movesideView(_ sender: UITapGestureRecognizer){
    
        if self.sideViewPresent == true{
            
        self.sideViewPresent = false
            UIView.animate(withDuration:1, animations: {
            self.presentSideView()
            },completion:nil)
        
        
        }
    
    }
    
    private func addTabGestureOnView(){
    
       let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.processONTabGesture(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.myview.addGestureRecognizer(tapGesture)
        
    }
    
    func processONTabGesture(_ sender: UITapGestureRecognizer){
        
        self.sideViewPresent = true
        UIView.animate(withDuration: 0.8, animations: {
            let w = self.view.frame.size.width - 100
            self.myview.frame.origin.x -= w
        }, completion: nil)
    
    
    }

    @IBAction func animate_pressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.8, animations: {
          self.sideViewPresent = true
            let w = self.view.frame.size.width - 100
            self.myview.frame.origin.x -= w
        }, completion: nil)
        
        
    }
}

