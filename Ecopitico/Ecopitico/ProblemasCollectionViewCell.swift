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
        problemNameLabel.text = "Plástico no rio Capibaribe"
        problemNameLabel.font = UIFont.systemFont(ofSize: 8)
        problemNameLabel.textColor = UIColor(named: "EcoBlack")
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
            problemImage.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        // Label do nome do problema
        problemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            problemNameLabel.topAnchor.constraint(equalTo: problemImage.bottomAnchor, constant: 10),
            problemNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            problemNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
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
            ProblemasCollectionViewCell().showPreview().previewLayout(PreviewLayout.fixed(width: 100, height: 100))
        }
    }
}
#endif
