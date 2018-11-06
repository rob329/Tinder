//
//  ProfileViewController.swift
//  swiping
//
//  Created by Robert Bolt on 10/29/18.
//  Copyright © 2018 Robert Bolt. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
