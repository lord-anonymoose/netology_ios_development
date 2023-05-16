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
    }
}
