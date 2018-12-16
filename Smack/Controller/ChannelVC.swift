//
//  ChannelVC.swift
//  Smack
//
//  Created by Pavel Ponomarev on 12/13/18.
//  Copyright © 2018 Pavel Ponomarev. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }
}
