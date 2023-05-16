//
//  PostView.swift
//  iOSUI_HW_2
//
//  Created by Philipp Lazarev on 16.05.2023.
//

import UIKit

class PostView: UIView {
    @IBOutlet weak var userImageView: UIImageView?
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var text: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
