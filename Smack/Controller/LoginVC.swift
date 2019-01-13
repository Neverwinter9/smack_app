//
//  LoginVC.swift
//  Smack
//
//  Created by Pavel Ponomarev on 12/17/18.
//  Copyright © 2018 Pavel Ponomarev. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    // Outlets
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var loginBtn: RoundedButton!
    @IBOutlet weak var disclaimer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
    
    @IBAction func loginPressed(_ sender: Any) {
        
        if emailTxt.text == "" || passwordTxt.text == "" {
            disclaimer.isHidden = false
            spinner.isHidden = true
        } else {
            disclaimer.isHidden = true
            spinner.isHidden = false
            spinner.startAnimating()
        }
        
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let pass = passwordTxt.text , passwordTxt.text != "" else { return }
        
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    func setupView() {
        // Loading spinner
        spinner.isHidden = true
        disclaimer.isHidden = true
        
        // Custom placeholders
        emailTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
    }
    
    
}
