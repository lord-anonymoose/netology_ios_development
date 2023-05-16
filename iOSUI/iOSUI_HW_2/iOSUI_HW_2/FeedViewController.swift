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
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.button1.setTitle(posts[0].text, for: .normal)
        view.button1.titleLabel?.sizeToFit()
        view.button1.titleLabel?.numberOfLines = 0
        view.button1.titleLabel?.lineBreakMode = .byWordWrapping

        view.button2.setTitle(posts[1].text, for: .normal)
        view.button2.titleLabel?.sizeToFit()
        view.button2.titleLabel?.numberOfLines = 0
        view.button2.titleLabel?.lineBreakMode = .byWordWrapping
        
        view.button3.setTitle(posts[2].text, for: .normal)
        view.button3.titleLabel?.sizeToFit()
        view.button3.titleLabel?.numberOfLines = 0
        view.button3.titleLabel?.lineBreakMode = .byWordWrapping
        
        view.button4.setTitle(posts[3].text, for: .normal)
        view.button4.titleLabel?.sizeToFit()
        view.button4.titleLabel?.numberOfLines = 0
        view.button4.titleLabel?.lineBreakMode = .byWordWrapping
        
        view.button5.setTitle(posts[4].text, for: .normal)
        view.button5.titleLabel?.sizeToFit()
        view.button5.titleLabel?.numberOfLines = 0
        view.button5.titleLabel?.lineBreakMode = .byWordWrapping
        
        view.button6.setTitle(posts[5].text, for: .normal)
        view.button6.titleLabel?.sizeToFit()
        view.button6.titleLabel?.numberOfLines = 0
        view.button6.titleLabel?.lineBreakMode = .byWordWrapping
        
        view.button7.setTitle(posts[6].text, for: .normal)
        view.button7.titleLabel?.sizeToFit()
        view.button7.titleLabel?.numberOfLines = 0
        view.button7.titleLabel?.lineBreakMode = .byWordWrapping

        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(feedView)
    }
}
