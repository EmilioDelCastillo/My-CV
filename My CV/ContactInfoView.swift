//
//  ContactInfoView.swift
//  My CV
//
//  Created by Emilio Del Castillo on 09/12/2020.
//

import UIKit

class ContactInfoView: UIViewController {

    // My LinkedIn profile picture
    // I don't know how the URL will update if I change it
    private let imageURL = URL(string: "https://media-exp1.licdn.com/dms/image/C5603AQEz1Q96XuyBlg/profile-displayphoto-shrink_200_200/0/1611090527416?e=1619654400&v=beta&t=lsTI7jIUEzvvZiyQnpiKCxDmmFtxg7QfeslNaM0d270")
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var interviewButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Set the image
        spinner.startAnimating()
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let url = self?.imageURL else { return }
            
            let image = try? UIImage(data: Data(contentsOf: url))
            let photo = UIImage(named: "photo")! // It has to exist!

            DispatchQueue.main.async {
                self?.imageView.layer.cornerRadius = (self?.imageView.frame.width)! / 2 // It makes it round
                self?.imageView.image = image ?? photo
                self?.imageView.contentMode = .scaleAspectFill
                self?.spinner.stopAnimating()
            }
        }
        
        
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
