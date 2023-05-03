//
//  ViewController.swift
//  iOSUI_HW_1
//
//  Created by Philipp Lazarev on 01.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let textColor = UIColor(named: "textColor")

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameView: UILabel!
    
    @IBOutlet weak var birthdateView: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var cityView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameView.text = "Tim Cook"
        birthdateView.text = "November 1st, 1960"
        
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .semibold)
        let attachment = NSTextAttachment()
        attachment.image = UIImage(systemName: "location", withConfiguration: symbolConfig)?.withTintColor(textColor ?? .black)

        let imageString = NSMutableAttributedString(attachment: attachment)
        let textString = NSAttributedString(string: "Cupertino")
        imageString.append(textString)

        cityView.attributedText = imageString
        cityView.sizeToFit()
    }


}

