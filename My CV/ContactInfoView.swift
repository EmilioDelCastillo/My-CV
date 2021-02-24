//
//  ContactInfoView.swift
//  My CV
//
//  Created by Emilio Del Castillo on 09/12/2020.
//

import UIKit

class ContactInfoView: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 100
        
        // TODO: Center the picture
        imageView.image = UIImage(named: "photo")

    }
    

}
