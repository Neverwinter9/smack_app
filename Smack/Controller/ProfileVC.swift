//
//  ProfileVC.swift
//  Smack
//
//  Created by Pavel Ponomarev on 12/29/18.
//  Copyright © 2018 Pavel Ponomarev. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    // Outlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        NotificationCenter.default.addObserver(self, selector: #selector(ProfileVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)

    }
    
    @IBAction func closeModelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil) // To notify other classes that user data did change for data cleanup
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editUsernamePressed(_ sender: Any) {
        let editUsername = EditUsernameVC()
        editUsername.modalPresentationStyle = .custom
        present(editUsername, animated: true, completion: nil)
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        userName.text = UserDataService.instance.name
    }
    
    func setupView() {
        
        // To apply user data to ProfileVC
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        profileImg.image = UIImage(named: UserDataService.instance.avatarName)
        profileImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
}
