//
//  ContatoView.swift
//  Ecopitico
//
//  Created by jpbol on 22/09/22.
//

import UIKit

class ContatoView: UIView {
    let label = UILabel()
    let instagramButton = UIButton()
    let twitterButton = UIButton()
    
    func updateTextInstagramButton (_ text: String? ){
        guard let text = text else {return}
        instagramButton.setTitle("Siga \(text) no Instagram", for: .normal)
    }
    func updateTextTwitterButton (_ text: String? ){
        guard let text = text else {return}
        twitterButton.setTitle("Acompanhe o twitter de \(text)", for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Redes sociais"
        label.font = UIFont(name: "Nunito-Bold", size: 18)
        label.textColor = .black
        self.addSubview(label)
        
        instagramButton.translatesAutoresizingMaskIntoConstraints = false
        instagramButton.setImage(UIImage(named: "instagram"), for: .normal)
        instagramButton.backgroundColor = UIColor(named: "EcoGreen")
        instagramButton.semanticContentAttribute = .forceLeftToRight
        instagramButton.titleLabel?.font = UIFont(name: "Nunito-Medium", size: 16)
        instagramButton.layer.cornerRadius = 8
        instagramButton.imageEdgeInsets.left = -28


        self.addSubview(instagramButton)
        
        twitterButton.translatesAutoresizingMaskIntoConstraints = false
        twitterButton.setImage(UIImage(named: "twitter"), for: .normal)
        twitterButton.backgroundColor = UIColor(named: "EcoGreen")
        twitterButton.semanticContentAttribute = .forceLeftToRight
        twitterButton.titleLabel?.font = UIFont(name: "Nunito-Medium", size: 16)
        twitterButton.layer.cornerRadius = 8
        twitterButton.imageEdgeInsets.left = -28


        self.addSubview(twitterButton)
        
        NSLayoutConstraint.activate([label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15), label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15), label.topAnchor.constraint(equalTo: self.topAnchor)])
        
        NSLayoutConstraint.activate([instagramButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8), instagramButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15), instagramButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15), instagramButton.heightAnchor.constraint(equalToConstant: 50)])
        
        NSLayoutConstraint.activate([twitterButton.topAnchor.constraint(equalTo: instagramButton.bottomAnchor, constant: 8), twitterButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15), twitterButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15), twitterButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
