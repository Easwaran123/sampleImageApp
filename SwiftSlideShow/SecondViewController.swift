//
//  SecondViewController.swift
//  ImageDemo
//
//  Created by Logesh on 17/04/18.
//  Copyright © 2018 Malek Trabelsi. All rights reserved.
//

import UIKit
import ISHPullUp



class SecondViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,ISHPullUpSizingDelegate, ISHPullUpStateDelegate {
    
   
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var btnOutlet: UIButton!
    @IBOutlet weak var txtLbl: UILabel!
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var textViewShow: UITextView!
    
    @IBOutlet weak var scrollText: UIScrollView!
    
    @IBOutlet weak var collectShow: UICollectionView!
    let elements = ["11","22","11"]
    
    @IBOutlet weak var labelOne: UILabel!
    var text: String? = nil
    
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var handleView: ISHPullUpHandleView!
    private var firstAppearanceCompleted = false
    weak var pullUpController: ISHPullUpViewController!
    
    
    private var halfWayPoint = CGFloat(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.layer.cornerRadius = 25.0
        let userUpdateNotification1 = Notification.Name("screenone")
        NotificationCenter.default.addObserver(self, selector: #selector(update1(notes:)), name: userUpdateNotification1, object: nil)
        let userUpdateNotification2 = Notification.Name("screentwo")
        NotificationCenter.default.addObserver(self, selector: #selector(update2(notes:)), name: userUpdateNotification2, object: nil)
        let userUpdateNotification3 = Notification.Name("screenthree")
        NotificationCenter.default.addObserver(self, selector: #selector(update3(notes:)), name: userUpdateNotification3, object: nil)
        let userUpdateNotification4 = Notification.Name("screenfour")
        NotificationCenter.default.addObserver(self, selector: #selector(update4(notes:)), name: userUpdateNotification4, object: nil)
        
         labelOne.text = "Jim"
         labelTwo.text = "Avatar"
         textViewShow.text = "Sweettutos.com is your blog of choice for Mobile tutorials"
        
        
        btnOutlet.backgroundColor = .clear
        btnOutlet.layer.cornerRadius = 15
        btnOutlet.layer.borderWidth = 1
        btnOutlet.layer.borderColor = UIColor.red.cgColor
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        topView.addGestureRecognizer(tapGesture)
    }

    @objc func update1(notes: Notification) {

        if let userInfo = notes.userInfo {
            // userInfo is the payload send by sender of notification
            if let userName = userInfo["name"] as? String {
                labelOne.text = userName
                print(labelOne.text)
            }
            if let userName = userInfo["cine"] as? String {
                labelTwo.text = userName
                print(labelTwo.text)
            }
            if let userName = userInfo["textwire"] as? String {
                textViewShow.text = userName
                print(textViewShow.text)
            }
        }
    }
    @objc func update2(notes: Notification) {

        if let userInfo = notes.userInfo {
            // userInfo is the payload send by sender of notification
            if let userName = userInfo["name"] as? String {
                labelOne.text = userName
                print(labelOne.text)
            }
            if let userName = userInfo["cine"] as? String {
                labelTwo.text = userName
                print(labelTwo.text)
            }
            if let userName = userInfo["textwire"] as? String {
                textViewShow.text = userName
                print(textViewShow.text)
            }
        }
    }
    @objc func update3(notes: Notification) {

        if let userInfo = notes.userInfo {
        // userInfo is the payload send by sender of notification
        if let userName = userInfo["name"] as? String {
            labelOne.text = userName
            print(labelOne.text)
        }
        if let userName = userInfo["cine"] as? String {
            labelTwo.text = userName
            print(labelTwo.text)
        }
        if let userName = userInfo["textwire"] as? String {
            textViewShow.text = userName
            print(textViewShow.text)
        }
        }
    }
    @objc func update4(notes: Notification) {

        if let userInfo = notes.userInfo {
            // userInfo is the payload send by sender of notification
            if let userName = userInfo["name"] as? String {
                labelOne.text = userName
                print(labelOne.text)
            }
            if let userName = userInfo["cine"] as? String {
                labelTwo.text = userName
                print(labelTwo.text)
            }
            if let userName = userInfo["textwire"] as? String {
                textViewShow.text = userName
                print(textViewShow.text)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        firstAppearanceCompleted = true;
    }
    
    
    @objc private dynamic func handleTapGesture(gesture: UITapGestureRecognizer) {
        if pullUpController.isLocked {
            return
        }
        
        pullUpController.toggleState(animated: true)
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return elements.count
        
    }
    
    @IBAction func btnAction(_ sender: Any) {
       
       
    }
    
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "custom", for: indexPath)as! CustomCollectionViewCell
            //        cell.customView.layer.cornerRadius = cell.customView.frame.height/2
            //        cell.customLbl.text = elements[indexPath.row]
            cell.customImage.image = UIImage(named: elements[indexPath.row])
            cell.customImage.layer.cornerRadius = cell.customImage.frame.height/2
            return cell
    }

    func pullUpViewController(_ pullUpViewController: ISHPullUpViewController, minimumHeightForBottomViewController bottomVC: UIViewController) -> CGFloat {
         return topView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
    }
    
    func pullUpViewController(_ pullUpViewController: ISHPullUpViewController, maximumHeightForBottomViewController bottomVC: UIViewController, maximumAvailableHeight: CGFloat) -> CGFloat {
        let totalHeight = rootView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height         
        
        halfWayPoint = totalHeight / 2.0
        return totalHeight
    }
    
    func pullUpViewController(_ pullUpViewController: ISHPullUpViewController, targetHeightForBottomViewController bottomVC: UIViewController, fromCurrentHeight height: CGFloat) -> CGFloat {
        if abs(height - halfWayPoint) < 30 {
            return halfWayPoint
        }
        
        // default behaviour
        return height
    }
    
    func pullUpViewController(_ pullUpViewController: ISHPullUpViewController, update edgeInsets: UIEdgeInsets, forBottomViewController contentVC: UIViewController) {
         scrollText.contentInset = edgeInsets;
    }
    
    private func textForState(_ state: ISHPullUpState) -> String {
        switch state {
        case .collapsed:
            return "Drag up or tap"
        case .intermediate:
            return "Intermediate"
        case .dragging:
            return "Hold on"
        case .expanded:
            return "Drag down or tap"
        }
    }
    
    func pullUpViewController(_ pullUpViewController: ISHPullUpViewController, didChangeTo state: ISHPullUpState) {
     txtLbl.text = textForState(state);
      handleView.setState(ISHPullUpHandleView.handleState(for: state), animated: firstAppearanceCompleted)
        
        // Hide the scrollview in the collapsed state to avoid collision
        // with the soft home button on iPhone X
        UIView.animate(withDuration: 0.25) { [weak self] in
         self?.scrollText.alpha = (state == .collapsed) ? 0 : 1;
        }
        
    }
    

}

private typealias Scroll = SecondViewController
extension Scroll
{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        
        
        print("aaaaa",currentPage)
        // Change the indicator
//        self.pageControl.currentPage = Int(currentPage);
        // Change the text accordingly
        if Int(currentPage) == 0{
                        textViewShow.text = "Sweettutos.com is your blog of choice for Mobile tutorials"
        }else if Int(currentPage) == 1{
                        textViewShow.text = "I write mobile tutorials mainly targeting iOS"
        }else if Int(currentPage) == 2{
                        textViewShow.text = "And sometimes I write games tutorials about Unity"
        }else{
                        textViewShow.text = "Keep visiting sweettutos.com for new coming tutorials, and don't forget to subscribe to be notified by email :)"
            // Show the "Let's Start" button in the last slide (with a fade in animation)
            UIView.animate(withDuration: 1.0, animations: { () -> Void in
                
            })
        }
    }
}
