//
//  MainViewController.swift
//  ImageDemo
//
//  Created by Logesh on 17/04/18.
//  Copyright © 2018 Malek Trabelsi. All rights reserved.
//


import UIKit
import ISHPullUp

class MainViewController: ISHPullUpViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }

    private func commonInit() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
      //  let contentVC1 = storyBoard.instantiateViewController(withIdentifier: "content") as! BeginViewController
        let contentVC = storyBoard.instantiateViewController(withIdentifier: "content") as! ViewController
        let bottomVC = storyBoard.instantiateViewController(withIdentifier: "bottom") as! SecondViewController
        

       
        contentViewController = contentVC
        bottomViewController = bottomVC
        bottomVC.pullUpController = self
        contentDelegate = contentVC
        sizingDelegate = bottomVC
        stateDelegate = bottomVC
        
        
    }
}


