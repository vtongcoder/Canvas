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
  
  var trayOriginalCenter: CGPoint!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  @IBAction func panTrayView(sender: UIPanGestureRecognizer) {
    let point = sender.locationInView(view)
    let velocity = sender.velocityInView(view)
    if sender.state == UIGestureRecognizerState.Began {
      trayOriginalCenter = trayView.center
    } else if sender.state == UIGestureRecognizerState.Changed {
      let translation = sender.translationInView(view)
      trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
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
