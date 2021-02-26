//
//  CardView.swift
//  My CV
//
//  Created by Emilio Del Castillo on 05/11/2020.
//

import UIKit

@IBDesignable
class CardView: UIView {

    var title: String = "Titre test"
    lazy private var titleLabel = createTitleLabel()

    var desc: String = "Une trèèèèèèèès très très trèèèès longue description pour tester l'affichage ! C'est que c'est pas facile tout ça"

    lazy private var descriptionLabel = createDescriptionTextView()
    
    // Accessibility
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsDisplay()
        setNeedsLayout()
    }
    
    private func centeredAttributedString(_ string: String, fontSize:CGFloat, style: UIFont.TextStyle) -> NSAttributedString {
        
        var font = UIFont.preferredFont(forTextStyle: style).withSize(fontSize)
        // Accessibility
        font = UIFontMetrics(forTextStyle: style).scaledFont(for: font)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        return NSAttributedString(string: string, attributes: [.paragraphStyle: paragraphStyle, .font: font, .foregroundColor: #colorLiteral(red: 0.2941176471, green: 0.2470588235, blue: 0.4470588235, alpha: 1)])
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureTitleLabel(titleLabel)
        configureDescriptionTextView(descriptionLabel)
    }
    
    override func draw(_ rect: CGRect) {
        // TODO: Remove magic numbers
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16) // Magic numbers
        roundedRect.addClip()
        #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).setFill()
        roundedRect.fill()
    }
}

// MARK: - TITLE
extension CardView {
    
    private var titleString: NSAttributedString {
        return centeredAttributedString(title, fontSize: 0.0, style: .headline)
    }
    
    private func configureTitleLabel(_ label: UILabel){
        label.attributedText = titleString
//        label.layer.borderWidth = 1 // For debug
    }
    
    private func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()

        constraints.append(label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5))
        constraints.append(label.heightAnchor.constraint(equalToConstant: 20))
        constraints.append(label.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        constraints.append(label.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -5))
        
        NSLayoutConstraint.activate(constraints)
        
        return label
    }
}

// MARK: - DESCRIPTION
extension CardView {
    private var descriptionString: NSAttributedString {
        return centeredAttributedString(desc, fontSize: 0.0, style: .body)
    }

    private func configureDescriptionTextView(_ label: UITextView){
        label.attributedText = descriptionString
//        label.layer.borderWidth = 1 // For debug
        
    }
    
    private func createDescriptionTextView() -> UITextView {
        let label = UITextView()
        label.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 0)

        label.isEditable = false
        label.isSelectable = false
        label.isScrollEnabled = false
        
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(label.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5))
        constraints.append(self.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 5))
        constraints.append(label.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        constraints.append(label.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10))
        
        NSLayoutConstraint.activate(constraints)
        
        return label
    }
}
