//
//  ProfileViewController.swift
//  CodePathTinder
//
//  Created by Mark Kinoshita  on 3/30/18.
//  Copyright © 2018 CodePathTinder. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var ProfileView: UIImageView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.image != nil {
            ProfileView.image = self.image
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
