//
//  ProfileViewController.swift.swift
//  iOSUI_HW_1
//
//  Created by Philipp Lazarev on 03.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private var profileView: ProfileView! // создаем переменную для дальнейшего использования
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textColor = UIColor(named: "textColor")
        
        guard let profileView = Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)?.first as? ProfileView else {
            fatalError("Unable to load ProfileView from nib")
        }
        
        profileView.frame = view.bounds
        profileView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        profileView.nameView?.text = "Tim Cook"
        profileView.birthdateView?.text = "November 1st, 1960"
        
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .semibold)
        let attachment = NSTextAttachment()
        attachment.image = UIImage(systemName: "location", withConfiguration: symbolConfig)?.withTintColor(textColor ?? .black)

        let imageString = NSMutableAttributedString(attachment: attachment)
        let textString = NSAttributedString(string: "Cupertino")
        imageString.append(textString)
        
        profileView.cityView?.attributedText = imageString
        
        view.addSubview(profileView)
        self.profileView = profileView // присваиваем значение созданной переменной
    }
}
