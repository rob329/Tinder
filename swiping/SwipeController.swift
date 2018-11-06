//
//  SwipeController.swift
//  swiping
//
//  Created by Robert Bolt on 10/29/18.
//  Copyright © 2018 Robert Bolt. All rights reserved.
//

import UIKit

class SwipeController: UIViewController {
    var divisor: CGFloat!
    var timer = Timer()
    var inBack = false
    
    @IBOutlet var wholeView: UIView!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var backCard: UIView!
    
    override func viewDidLoad() {
        divisor = (view.frame.width/2) / 0.61
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTap(_ sender: Any) {
        self.performSegue(withIdentifier: "profileSegue", sender: self)
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        self.backCard.alpha = 1
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        let scale = min(100/abs(xFromCenter), 1)
        
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor).scaledBy(x: scale, y: scale)
        
        if xFromCenter > 0 {
            
        }
        if sender.state == .ended{
            UIView.animate(withDuration: 0.2, animations: {
                if card.center.x < 75{
                    //move to left
                    UIView.animate(withDuration: 0.3, animations: {
                         card.center = CGPoint(x: card.center.x - 200, y: card.center.y)
                         card.alpha = 0
                    }){(finished: Bool) -> Void in UIView.animate(withDuration: 0.3, animations: { () -> Void in
                            if(card == self.card){
                                self.wholeView.sendSubview(toBack: self.card)
                                self.wholeView.sendSubview(toBack: self.card)
                                self.card.center = self.view.center
                                self.card.alpha = 1
                                self.card.transform = CGAffineTransform.identity

                            }
                            else{
                                self.wholeView.sendSubview(toBack: self.backCard)
                                self.backCard.center = self.view.center
                                self.backCard.alpha = 1
                                self.backCard.transform = CGAffineTransform.identity
                            }
                    })}
                    return
                }
                else if card.center.x > (self.view.frame.width - 75){
                    //Move to right
                    UIView.animate(withDuration: 0.3, animations: {
                        card.center = CGPoint(x: card.center.x + 200, y: card.center.y)
                        card.alpha = 0
                        
                    })
                    {(finished: Bool) -> Void in UIView.animate(withDuration: 0.3, animations: { () -> Void in
                        if(card == self.card){
                            self.wholeView.sendSubview(toBack: self.card)
                            self.card.center = self.view.center
                            self.card.alpha = 1
                            self.card.transform = CGAffineTransform.identity
                        }
                        else{
                            self.wholeView.sendSubview(toBack: self.backCard)
                            self.backCard.center = self.view.center
                            self.backCard.alpha = 1
                            self.backCard.transform = CGAffineTransform.identity
                        }
                    })}
                    return
                }
                self.resetCard(sender: sender.view!)
            })
        }
     }
    
    
    func resetCard(sender: UIView){
        UIView.animate(withDuration: 0.3, animations: {
            sender.center = self.view.center
            sender.alpha = 1
            sender.transform = CGAffineTransform.identity
        })
        
        
    }
    
    
    

}
