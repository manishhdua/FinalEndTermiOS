//
//  ProfileViewController.swift
//  EndTerm
//
//  Created by Manish Dua on 2019-12-04.
//  Copyright © 2019 Manish Dua. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var userImage : UIImage!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    var userlable: String?
    var bio: String?
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = userImage
        userNameLabel.text = userlable
        bioLabel.text = bio
        
    }
    


}
