//
//  ProfileViewController.swift
//  iOSUI_HW_2
//
//  Created by Philipp Lazarev on 12.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    private var profileView: ProfileView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var user: User
        if let randomElement = users.randomElement() {
            user = randomElement
        } else {
            user = User(login: "default", name: "default")
        }
        
        guard let profileView = Bundle.main.loadNibNamed("profileView", owner: self, options: nil)?.first as? ProfileView else {
                    fatalError("Unable to load ProfileView from nib")
                }
        
        profileView.frame = view.bounds
        profileView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        profileView.userLogin?.text = "@\(user.login)"
        profileView.userName.text = user.name
        profileView.userImageView?.image = UIImage(named: user.login)
        view.addSubview(profileView)
        self.profileView = profileView
    }
}
