//
//  EditUsernameVC.swift
//  Smack
//
//  Created by Pavel Ponomarev on 1/15/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import UIKit

class EditUsernameVC: UIViewController {

    // Outlets
    @IBOutlet weak var newUsernameTxt: UITextField!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var disclaimer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    @IBAction func editUsernamePressed(_ sender: Any) {
        
        if newUsernameTxt.text == "" {
            disclaimer.isHidden = false
            spinner.isHidden = true
        } else {
            disclaimer.isHidden = true
            spinner.isHidden = false
            spinner.startAnimating()
        }
        
        guard let name = newUsernameTxt.text , newUsernameTxt.text != "" else { return }
        
        AuthService.instance.changeUsername(name: name) { (success) in
            if success {
                self.spinner.isHidden = true
                self.spinner.stopAnimating()
                self.dismiss(animated: true, completion: nil)
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            }
        }
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        
        spinner.isHidden = true
        disclaimer.isHidden = true
        
        // Custom placeholders
        newUsernameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        
        // Tap gesture recognizer
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
}
