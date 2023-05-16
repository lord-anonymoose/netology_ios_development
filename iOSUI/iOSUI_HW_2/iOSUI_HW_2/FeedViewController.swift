//
//  FeedViewController.swift
//  iOSUI_HW_2
//
//  Created by Philipp Lazarev on 16.05.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    
    private var feedView: FeedView {
        let view = Bundle.main.loadNibNamed("feedView", owner: nil)?.first as! FeedView
        view.frame = view.bounds
        
        view.button1.setTitle(posts[0].text, for: .normal)
        view.button1.titleLabel?.sizeToFit()
        view.button1.titleLabel?.numberOfLines = 0
        view.button1.titleLabel?.lineBreakMode = .byWordWrapping
        view.button1.tag = 0
        view.button1.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        view.button2.setTitle(posts[1].text, for: .normal)
        view.button2.titleLabel?.sizeToFit()
        view.button2.titleLabel?.numberOfLines = 0
        view.button2.titleLabel?.lineBreakMode = .byWordWrapping
        view.button2.tag = 1
        view.button2.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        view.button3.setTitle(posts[2].text, for: .normal)
        view.button3.titleLabel?.sizeToFit()
        view.button3.titleLabel?.numberOfLines = 0
        view.button3.titleLabel?.lineBreakMode = .byWordWrapping
        view.button3.tag = 2
        view.button3.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        view.button4.setTitle(posts[3].text, for: .normal)
        view.button4.titleLabel?.sizeToFit()
        view.button4.titleLabel?.numberOfLines = 0
        view.button4.titleLabel?.lineBreakMode = .byWordWrapping
        view.button4.tag = 3
        view.button4.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        view.button5.setTitle(posts[4].text, for: .normal)
        view.button5.titleLabel?.sizeToFit()
        view.button5.titleLabel?.numberOfLines = 0
        view.button5.titleLabel?.lineBreakMode = .byWordWrapping
        view.button5.tag = 4
        view.button5.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        view.button6.setTitle(posts[5].text, for: .normal)
        view.button6.titleLabel?.sizeToFit()
        view.button6.titleLabel?.numberOfLines = 0
        view.button6.titleLabel?.lineBreakMode = .byWordWrapping
        view.button6.tag = 5
        view.button6.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        view.button7.setTitle(posts[6].text, for: .normal)
        view.button7.titleLabel?.sizeToFit()
        view.button7.titleLabel?.numberOfLines = 0
        view.button7.titleLabel?.lineBreakMode = .byWordWrapping
        view.button7.tag = 6
        view.button7.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(feedView)
    }
    
    
    @objc func buttonPressed(_ sender: UIButton) {
        let postViewController = PostViewController(post: posts[sender.tag])
        postViewController.title = "@\(posts[sender.tag].user.login)"
        
        let navigationController = UINavigationController(rootViewController: postViewController)
        
        present(navigationController, animated: true)
    }
    
}
