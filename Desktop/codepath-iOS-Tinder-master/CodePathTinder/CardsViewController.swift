//
//  CardsViewController.swift
//  CodePathTinder
//
//  Created by Mark Kinoshita  on 3/30/18.
//  Copyright © 2018 CodePathTinder. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var cardInitialCenter: CGPoint!

    @IBOutlet weak var profileView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapPhoto(_ sender: AnyObject) {
        performSegue(withIdentifier: "toProfile", sender: sender)
    }
    
    
    @IBAction func didSwipePhoto(_ sender: AnyObject) {
        print("DIDSWIPEPHOTO")
        let translation = sender.translation(in: view)
        
        print("translation \(translation)")
        
        if sender.state == .began {
            cardInitialCenter = profileView.center
            
        } else if sender.state == .changed {
            let rotation = CGAffineTransform(rotationAngle: translation.x / 100)
            profileView.transform = rotation
            
            profileView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
            
            
        } else if sender.state == .ended {
            if translation.x < 50 {
                UIView.animate(withDuration: 1.0, delay: 0.2, options: [.autoreverse], animations: {
                    print("x is less than 50")
                    self.profileView.center = CGPoint(x: -15000, y: self.cardInitialCenter.y)
                }, completion: nil)
            } else if translation.x > 50 {
                print("x is greater than 50")
                UIView.animate(withDuration: 1.0, delay: 0.2, options: [.autoreverse], animations: {
                    self.profileView.center = CGPoint(x: 15000, y: self.cardInitialCenter.y)
                }, completion: nil)
            } else {
                
            }
            
        }


    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toProfile" {
            print("toProfile")
            //let mainStoryBoard = UIStoryboard(name: "Main",bundle: nil)
            //let vc = mainStoryBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
            let vc = segue.destination as! ProfileViewController
            //let vc = segue.destination as! ProfileViewController
            vc.image = self.profileView.image!
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
