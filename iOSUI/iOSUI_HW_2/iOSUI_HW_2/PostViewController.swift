//
//  PostViewController.swift
//  iOSUI_HW_2
//
//  Created by Philipp Lazarev on 16.05.2023.
//

import UIKit

class PostViewController: UIViewController {
    var post: Post
    
    private var postView: PostView {
        let view = Bundle.main.loadNibNamed("postView", owner: nil)?.first as! PostView
        view.frame = view.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.userName.text = post.user.name
        view.text.text = post.text
        view.text.sizeToFit()
        view.userImageView?.image = UIImage(named: post.user.login)
        return view
    }
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(postView)
        let infoButton = UIButton(type: .system)
        infoButton.setTitle("Info", for: .normal)
        infoButton.addTarget(self, action: #selector(infoButtonPressed(_:)), for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: infoButton)
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func infoButtonPressed(_ sender: UIButton) {
        let infoViewController = InfoViewController()
        infoViewController.title = "Information"
        
        let navigationController = UINavigationController(rootViewController: infoViewController)
        
        present(navigationController, animated: true)
    }
}
