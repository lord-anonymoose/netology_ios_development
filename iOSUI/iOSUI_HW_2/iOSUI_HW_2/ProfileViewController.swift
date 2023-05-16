//
//  ProfileViewController.swift
//  iOSUI_HW_2
//
//  Created by Philipp Lazarev on 12.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var user = katyPerry
    
    private var profileView: ProfileView {
        let view = Bundle.main.loadNibNamed("profileView", owner: nil)?.first as! ProfileView
        view.frame = view.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.userLogin?.text = "@\(user.login)"
        view.userName.text = user.name
        view.userImageView?.image = UIImage(named: user.login)
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileView.frame = view.bounds
        profileView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        profileView.userLogin?.text = "@\(user.login)"
        profileView.userName.text = user.name
        profileView.userImageView?.image = UIImage(named: user.login)
        
        view.addSubview(profileView)
    }
}
