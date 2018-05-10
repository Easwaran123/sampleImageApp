//
//  ViewController.swift
//  SwiftSlideShow
//
//  Created by Malek Trabelsi on 11/29/17.
//  Copyright © 2017 Malek Trabelsi. All rights reserved.
//

import UIKit
import ISHPullUp
class ViewController: UIViewController, UIScrollViewDelegate,ISHPullUpContentDelegate {
    
    
   
    
    
    func pullUpViewController(_ pullUpViewController: ISHPullUpViewController, update edgeInsets: UIEdgeInsets, forContentViewController contentVC: UIViewController) {
        if #available(iOS 11.0, *) {
            additionalSafeAreaInsets = edgeInsets
            rootView.layoutMargins = .zero
        } else {
            // update edgeInsets
            rootView.layoutMargins = edgeInsets
        }

        // call layoutIfNeeded right away to participate in animations
        // this method may be called from within animation blocks
        rootView.layoutIfNeeded()
    }

    
    @IBOutlet weak var viewDisplay: UITextView!
    @IBOutlet weak var secondLbl: UILabel!
    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var startViews: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
//    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        //1
        self.startViews.alpha = 1.0
//              self.startButton.alpha = 1.0
        self.scrollView.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height)
        let scrollViewWidth:CGFloat = self.scrollView.frame.width
        let scrollViewHeight:CGFloat = self.scrollView.frame.height
        //2
//        textView.textAlignment = .center
//        textView.text = "Sweettutos.com is your blog of choice for Mobile tutorials"
//        textView.textColor = UIColor.black
//        self.startButton.layer.cornerRadius = 4.0
        //3
        let imgOne = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgOne.image = UIImage(named: "Slide 1")
        let imgTwo = UIImageView(frame: CGRect(x:scrollViewWidth, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgTwo.image = UIImage(named: "Slide 2")
        let imgThree = UIImageView(frame: CGRect(x:scrollViewWidth*2, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgThree.image = UIImage(named: "Slide 3")
        let imgFour = UIImageView(frame: CGRect(x:scrollViewWidth*3, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgFour.image = UIImage(named: "Slide 4")
        
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        self.scrollView.addSubview(imgFour)
        self.scrollView.addSubview(startViews)
        //4
        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.width * 4, height:self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.pageControl.currentPage = 0
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let viewControllerB = segue.destination as? SecondViewController {
//            viewControllerB.labelOne = firstLbl
//            viewControllerB.labelTwo = secondLbl
//            viewControllerB.textViewShow = viewDisplay
//            viewControllerB.delegate = self
//        }
//    }
    
    
    func textChanged(text1: String?, text2: String?, text3: String) {
        firstLbl.text = text1
        secondLbl.text = text2
        viewDisplay.text = text3
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
private typealias ScrollView = ViewController
extension ScrollView
{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage);
        // Change the text accordingly
        if Int(currentPage) == 0{
           viewDisplay.text = "Sweettutos.com is your blog of choice for Mobile tutorials"
//            func textChanged(text1: String?, text2: String?, text3: String) {
//                firstLbl.text = text1
//                secondLbl.text = text2
//                viewDisplay.text = text3
            
                NotificationCenter.default.post(name: NSNotification.Name("screenone"), object: self, userInfo: ["name": "Jim","cine": "Avatar","textwire": "Sweettutos.com is your blog of choice for Mobile tutorials"])
            
        }else if Int(currentPage) == 1{

//            viewDisplay.text = "I write mobile tutorials mainly targeting iOS"
//            func textChanged(text1: String?, text2: String?, text3: String) {
//                firstLbl.text = text1
//                secondLbl.text = text2
//                viewDisplay.text = text3
                NotificationCenter.default.post(name: NSNotification.Name("screentwo"), object: self, userInfo: ["name": "jack","cine": "tom cruise","textwire": "I write mobile tutorials mainly targeting iOS"])
            
        }else if Int(currentPage) == 2{
//            viewDisplay.text = "And sometimes I write games tutorials about Unity"
//            func textChanged(text1: String?, text2: String?, text3: String) {
//                firstLbl.text = text1
//                secondLbl.text = text2
//                viewDisplay.text = text3
                NotificationCenter.default.post(name: NSNotification.Name("screenthree"), object: self, userInfo: ["name": "jerry","cine": "jacsock","textwire": "And sometimes I write games tutorials about Unity"])
           
        }else{
//            viewDisplay.text = "Keep visiting sweettutos.com for new coming tutorials, and don't forget to subscribe to be notified by email :)"
//            func textChanged(text1: String?, text2: String?, text3: String) {
//                firstLbl.text = text1
//                secondLbl.text = text2
//                viewDisplay.text = text3
                NotificationCenter.default.post(name: NSNotification.Name("screenfour"), object: self, userInfo: ["name": "jasmin","cine": "Jim carry","textwire": "Keep visiting sweettutos.com for new coming tutorials, and don't forget to subscribe to be notified by email"])
            }
            // Show the "Let's Start" button in the last slide (with a fade in animation)
            UIView.animate(withDuration: 1.0, animations: { () -> Void in
          
            })
        }
    }

