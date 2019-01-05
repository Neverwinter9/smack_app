//
//  AddChannelVC.swift
//  Smack
//
//  Created by Pavel Ponomarev on 1/3/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    // Outlets
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var chanDesc: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func createChannelPressed(_ sender: Any) {
        guard let channelName = nameTxt.text , nameTxt.text != "" else { return }
        guard let channelDesc = chanDesc.text else { return }
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDesc) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        
        // Custom placeholders
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        chanDesc.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        
        // Tap gesture recognizer
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
