//
//  CardView.swift
//  My CV
//
//  Created by Emilio Del Castillo on 05/11/2020.
//

import UIKit

@IBDesignable
class CardView: UIView {

    let offset: CGFloat = 10
    
    var title: String = "Titre test"
    var desc: String = "Une trèèèèèèèès très très trèèèès longue description pour tester l'affichage ! C'est que c'est pas facile tout ça"

    var titleLabel = UILabel()
    var descriptionLabel = UILabel()

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
        configureDescriptionLabel(descriptionLabel)
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

    private func configureTitleLabel(_ label: UILabel) {
        
//        label.layer.borderWidth = 1 // For debug
        
        label.numberOfLines = 1
        label.attributedText = titleString
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        var constraints = [NSLayoutConstraint]()

        constraints.append(label.topAnchor.constraint(equalTo: self.topAnchor, constant: offset))
        constraints.append(label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: offset))
        constraints.append(label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -offset))

        NSLayoutConstraint.activate(constraints)

    }
}

// MARK: - DESCRIPTION
extension CardView {
    private var descriptionString: NSAttributedString {
        return centeredAttributedString(desc, fontSize: 0.0, style: .body)
    }

    private func configureDescriptionLabel(_ label: UILabel) {
        
        label.numberOfLines = 0
        label.attributedText = descriptionString

        addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()

        constraints.append(label.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: offset))
        constraints.append(label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -offset))
        constraints.append(label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: offset))
        constraints.append(label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -offset))

        NSLayoutConstraint.activate(constraints)
        
    }
}
