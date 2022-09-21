//
//  ProblemasCollectionViewCell.swift
//  Ecopitico
//
//  Created by sofia.ribeiro on 21/09/22.
//

import UIKit

class ProblemasCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProblemasCollectionViewCell"
    
    // MARK: - Inicialização dos componentes
    let problemImage = UIImageView()
    let problemNameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupAttributes()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(tipo: Int){
        if tipo == 0{
            problemImage.image = UIImage(named: "marine-debris 1")
            problemNameLabel.text = "Plástico no Rio Capibaribe"
            
        } else if tipo == 1{
            problemImage.image = UIImage(named: "waste 1")
            problemNameLabel.text = "Gases do efeito estufa"
        } else {
            problemImage.image = UIImage(named: "industrial 1")
            problemNameLabel.text = "Pesca predatória"
            
        }
    }
    
    func setupHierarchy(){
        // MARK: - Setup na hierarquia das subviews
        contentView.addSubview(self.problemImage)
        contentView.addSubview(self.problemNameLabel)
    }
    
    func setupAttributes(){
        // Configura a primeira imagem
        problemImage.image = UIImage(named: "marine-debris 1")
        problemImage.contentMode = .scaleAspectFit
        
        
        // Configura a label do nome da proposta
        problemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        problemNameLabel.text = "Plástico no Rio Capibaribe"
        problemNameLabel.font = UIFont.systemFont(ofSize: 12)
        problemNameLabel.textColor = UIColor(named: "EcoDarkgrey")
        problemNameLabel.textAlignment = .center
        problemNameLabel.numberOfLines = 0
        
    }
    
    func setupConstraints(){
        // Imagem do problema
        problemImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            problemImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            problemImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            problemImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            problemImage.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Label do nome do problema
        problemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            problemNameLabel.topAnchor.constraint(equalTo: problemImage.bottomAnchor, constant: 10),
            problemNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            problemNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            problemNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ProblemasCollectionViewCell_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ProblemasCollectionViewCell().showPreview().previewLayout(PreviewLayout.fixed(width: 124, height: 146))
        }
    }
}
#endif
