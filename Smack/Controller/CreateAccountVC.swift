//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Pavel Ponomarev on 12/17/18.
//  Copyright © 2018 Pavel Ponomarev. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
}
