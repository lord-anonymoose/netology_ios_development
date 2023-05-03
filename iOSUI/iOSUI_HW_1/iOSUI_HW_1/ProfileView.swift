//
//  ProfileView.swift
//  iOSUI_HW_1
//
//  Created by Philipp Lazarev on 03.05.2023.
//

import UIKit

class ProfileView: UIView {
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var nameView: UILabel?
    @IBOutlet weak var birthdateView: UILabel?
    @IBOutlet weak var cityView: UILabel?
    @IBOutlet weak var textView: UITextView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
       }

}
