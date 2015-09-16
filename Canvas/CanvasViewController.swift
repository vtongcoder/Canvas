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
  var isMoveUp: Bool = false
  var isMoveDown: Bool = false
  
  
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
    if sender.state == UIGestureRecognizerState.Began {
      trayOriginalCenter = trayView.center
    } else if sender.state == UIGestureRecognizerState.Changed {
//      let translation = sender.translationInView(view)
//      trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
      if velocity.y > 0 && !isMoveDown {
//        trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + trayView.frame.size.height - 50)
        isMoveDown = true
        isMoveUp  = false
        trayMoveAnimation(false)
        
      } else if velocity.y < 0 && !isMoveUp {
//        trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y - trayView.frame.size.height + 50)
        isMoveUp = true
        isMoveDown  = false
        trayMoveAnimation(true)
      }
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
