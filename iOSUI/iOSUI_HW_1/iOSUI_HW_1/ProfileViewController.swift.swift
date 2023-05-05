//
//  ProfileViewController.swift.swift
//  iOSUI_HW_1
//
//  Created by Philipp Lazarev on 03.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private var profileView: ProfileView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textColor = UIColor(named: "textColor")
        
        /*
         Этот код загружает экземпляр визуального интерфейса, который был создан в Interface Builder с использованием nib-файла (файла XIB). Он использует объект Bundle для загрузки nib-файла "ProfileView" и передает текущий объект владельца ("owner") как self. Затем он пытается произвести приведение типов, чтобы убедиться, что экземпляр, который был загружен из nib-файла, действительно является экземпляром класса ProfileView.

         Затем настраивается фрейм (размер и положение) профиля на основе фрейма представления (view) и устанавливается autoresizingMask, чтобы профиль масштабировался и изменял свой размер при изменении размера родительского представления.
         */
        
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
        self.profileView = profileView
    }
}
