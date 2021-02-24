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

    var desc: String = "Une longue description pour tester l'affichage !"

    private var titleString: NSAttributedString{
        return centeredAttributedString(title, fontSize: 0.0, style: .headline)
    }
    private var descriptionString: NSAttributedString{
        return centeredAttributedString(desc, fontSize: 0.0, style: .body)
    }

    lazy private var titleLabel = createTitleLabel()
    lazy private var descriptionLabel = createDescriptionLabel()
    
    private func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        addSubview(label)
        return label
    }
    
    private func createDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        addSubview(label)
        return label
    }
    
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
        return NSAttributedString(string: string, attributes: [.paragraphStyle: paragraphStyle, .font: font])
    }
    
    private func configureTitleLabel(_ label: UILabel){
        label.attributedText = titleString
        label.frame.size = CGSize.zero
        label.sizeToFit()
    }
    private func configureDescriptionLabel(_ label: UILabel){
        label.attributedText = descriptionString
        label.frame.size = CGSize.zero
        label.frame.size = sizeThatFits(bounds.size)
    }
    
    override func layoutSubviews() {
        // TODO: Remove magic numbers
        super.layoutSubviews()
        configureTitleLabel(titleLabel)
        let offset = bounds.width / 2 - (titleLabel.frame.size.width / 2)
        titleLabel.frame.origin = bounds.origin.offsetBy(dx: offset , dy: SizeRatio.offsetToUpperBound)
        
        
        configureDescriptionLabel(descriptionLabel)
        descriptionLabel.frame.origin = bounds.origin.offsetBy(dx: 0, dy: 10) // Magic numbers
    }
    
    override func draw(_ rect: CGRect) {
        // TODO: Remove magic numbers
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16) // Magic numbers
        roundedRect.addClip()
        UIColor.lightGray.setFill()
        roundedRect.fill()
    }
}

extension CardView {
    private struct SizeRatio {
        static let cornerRadiusToBoundsHeight: CGFloat = 0.1
        static let offsetToUpperBound: CGFloat = 10
        static let offsetToTitle: CGFloat = 0.33
    }
//    private var cornerRadius: CGFloat {
//        return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight
//    }
}

extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x+dx, y: y+dy)
    }
}
