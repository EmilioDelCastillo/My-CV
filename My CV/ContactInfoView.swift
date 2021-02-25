//
//  ContactInfoView.swift
//  My CV
//
//  Created by Emilio Del Castillo on 09/12/2020.
//

import UIKit

class ContactInfoView: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var interviewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Set the image
        imageView.layer.cornerRadius = imageView.frame.width / 2 // It makes it round
        imageView.image = UIImage(named: "photo")
        imageView.contentMode = .scaleAspectFill
        
        // MARK: - Set the button
        // TODO: Get rid of the magic number
        interviewButton.layer.cornerRadius = 10

        // MARK: - Set the text
        
        textView.text =
"""
Je suis à la recherche d'une entreprise pour m'accueillir lors de ma formation en alternance pour devenir développeur iOS.
Pour le contrat en question (apprentissage ou professionnalisation), je suis prêt à m'adapter aux besoins de l'entreprise.

Vous pouvez me contacter au
06 12 34 56 78
ou par mail à
prenom.exemple@serveur.com

Vous pouvez aussi m'envoyer directement une invitation pour un entretien avec le bouton ci-dessous.
"""
        
    }
    

}
