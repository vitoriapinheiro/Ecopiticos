//
//  ProblemasRecorrentesCollectionViewCell.swift
//  Ecopitico
//
//  Created by sofia.ribeiro on 22/09/22.
//

import UIKit

class ProblemasRecorrentesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProblemasRecorrentesCollectionViewCell"
        
        // MARK: - Inicialização dos componentes
        let problemaImagem = UIImageView()
        let problemaLabel = UILabel()
        
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
                problemaImagem.image = UIImage(named: "marine-debris 1")
                problemaLabel.text = "Plástico no Rio Capibaribe"
            } else if tipo == 1{
                problemaImagem.image = UIImage(named: "waste 1")
                problemaLabel.text = "Gases do efeito estufa"
                
            } else {
                problemaImagem.image = UIImage(named: "industrial 1")
                problemaLabel.text = "Pesca predatória"
                
            }
        }
        
        func setupHierarchy(){
            // MARK: - Setup na hierarquia das subviews
            contentView.addSubview(self.problemaImagem)
            contentView.addSubview(self.problemaLabel)
        }
        
        func setupAttributes(){
            // Configura a primeira imagem
            problemaImagem.contentMode = .scaleAspectFit
            
            
            // Configura a label do nome da proposta
            problemaLabel.translatesAutoresizingMaskIntoConstraints = false
            problemaLabel.font = UIFont.systemFont(ofSize: 12)
            problemaLabel.textColor = UIColor(named: "EcoDarkgrey")
            problemaLabel.textAlignment = .center
            problemaLabel.numberOfLines = 0
            
        }
        
        func setupConstraints(){
            // Imagem do problema
            problemaImagem.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                problemaImagem.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                problemaImagem.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                problemaImagem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                problemaImagem.heightAnchor.constraint(equalToConstant: 118)
            ])
            
            // Label do nome do problema
            problemaLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                problemaLabel.topAnchor.constraint(equalTo: problemaImagem.bottomAnchor, constant: 10),
                problemaLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                problemaLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                problemaLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ])
            
        }
    
}
