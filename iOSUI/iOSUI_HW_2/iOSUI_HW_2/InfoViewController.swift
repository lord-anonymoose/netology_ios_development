//
//  InfoViewController.swift
//  iOSUI_HW_2
//
//  Created by Philipp Lazarev on 16.05.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private var infoView: InfoView {
        let view = Bundle.main.loadNibNamed("infoView", owner: nil)?.first as! InfoView
        view.frame = view.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.rateButton.addTarget(self, action: #selector(rateButtonPressed(_:)), for: .touchUpInside)
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(infoView)
    }
    
    @objc func rateButtonPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Rate my App", message: "Let me know how you like my app!", preferredStyle: .alert)
        let goodAction = UIAlertAction(title: "👍", style: .default) {
            UIAlertAction in
            NSLog("Thank you! I appreciate it!")
        }
        let badAction = UIAlertAction(title: "👎", style: .default) {
            UIAlertAction in
            NSLog("Let me know how I can improve it!")
        }
        alertController.addAction(goodAction)
        alertController.addAction(badAction)
        present(alertController, animated: true, completion: nil)
        
    }
}
