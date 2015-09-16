//
//  CanvasViewController.swift
//  Canvas
//
//  Created by Dan Tong on 9/15/15.
//  Copyright © 2015 dantong. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {

  
  @IBOutlet weak var trayView: UIView!
  @IBOutlet weak var arrowImage: UIImageView!
  
  var trayOriginalCenter: CGPoint!
  var trayUpPosition: CGPoint!
  var trayDownPosition: CGPoint!
  var isMoveUp: Bool = true
  var isMoveDown: Bool = false
  var newlyCreatedFace: UIImageView!
  var imageOriginalCenter: CGPoint!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        trayUpPosition = CGPoint(x: 0, y: 0)
        trayDownPosition = CGPoint(x: 0, y: -50)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  @IBAction func panTrayView(sender: UIPanGestureRecognizer) {
//    let point = sender.locationInView(view)
    let velocity = sender.velocityInView(view)
    switch sender.state {
    case .Began:
      trayOriginalCenter = trayView.center
    case .Changed:
      if velocity.y > 0 && !isMoveDown {
        isMoveDown = true
        isMoveUp  = false
        trayMoveAnimation(false)
        
      } else if velocity.y < 0 && !isMoveUp {
        isMoveUp = true
        isMoveDown  = false
        trayMoveAnimation(true)
      }
    default:
      break
    }
   
  }
  @IBAction func imgViewPanGesture(sender: UIPanGestureRecognizer) {
    print("Pan image")
    switch sender.state {
    case .Began:
      let imageView = sender.view as! UIImageView
      newlyCreatedFace = UIImageView(image: imageView.image)
      view.addSubview(newlyCreatedFace)
      newlyCreatedFace.center.x = (trayView.frame.origin.x)
      newlyCreatedFace.center.y = (trayView.frame.origin.y)
      imageOriginalCenter = newlyCreatedFace.center
    case .Changed:
      let translation = sender.translationInView(view)
      newlyCreatedFace.center = CGPoint(x: self.imageOriginalCenter.x + translation.x, y: self.imageOriginalCenter.y + translation.y )
    default:
      break
      
    }
  }
  
  func trayMoveAnimation(isUp: Bool) {
    if !isUp{
      UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 5.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
        self.trayView.center = CGPoint(x: self.trayOriginalCenter.x, y: self.trayOriginalCenter.y + self.trayView.frame.size.height - 50)
        
        }, completion: { (finished: Bool) -> Void in
          UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.arrowImage.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
          })
          
      })
    } else {
      UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 5.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
        self.trayView.center = CGPoint(x: self.trayOriginalCenter.x, y: self.trayOriginalCenter.y - self.trayView.frame.size.height + 50)
        
        }, completion: { (finished: Bool) -> Void in
          UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.arrowImage.transform = CGAffineTransformMakeRotation(CGFloat(0))
          })
          
      })
    }
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
