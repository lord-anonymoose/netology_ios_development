//
//  FeedViewController.swift
//  iOS UI HW2
//
//  Created by Philipp Lazarev on 18.05.2023.
//

import UIKit

class FeedViewController: UIViewController, UIScrollViewDelegate {
    
    private lazy var buttons: [UIButton] = {
        var buttons = [UIButton]()
        for i in 0..<posts.count {
            let button = makeButton(with: i)
            buttons.append(button)
        }
        return buttons
    }()
    
    func makeButton(with num: Int) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(posts[num].text, for: .normal)
        button.sizeToFit()
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.setTitleColor(.label, for: .normal)
        button.setTitleColor(.blue, for: .application)
        button.tag = num
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        for button in buttons {
            view.addSubview(button)
            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            ])
        }
        
        if buttons.count > 0 {
            NSLayoutConstraint.activate([
                buttons[0].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
            ])
        }
        
        if buttons.count > 1 {
            for i in 1..<buttons.count {
                NSLayoutConstraint.activate([
                    buttons[i].topAnchor.constraint(equalTo: buttons[i-1].bottomAnchor, constant: buttons[i].intrinsicContentSize.height*0.75 + 20)
                ])
            }
        }
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        let postViewController = PostViewController(post: posts[sender.tag])
        postViewController.title = "@\(posts[sender.tag].user.login)"
        
        let navigationController = UINavigationController(rootViewController: postViewController)
        
        present(navigationController, animated: true)
    }
}
