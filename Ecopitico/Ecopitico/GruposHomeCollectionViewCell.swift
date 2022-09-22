//
//  GruposHomeCollectionViewCell.swift
//  Ecopitico
//
//  Created by sofia.ribeiro on 22/09/22.
//

import UIKit

class GruposHomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GruposHomeCollectionViewCell"
        
        // MARK: - Inicialização dos componentes
        let groupImage = UIImageView()
        let groupNameLabel = UILabel()
        
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
                groupImage.image = UIImage(named: "foto1grupo")
                groupNameLabel.text = "Xô, plástico!"
                
            } else if tipo == 1{
                groupImage.image = UIImage(named: "fotogrupo2")
                groupNameLabel.text = "LimpaRec"
            } else if tipo == 2{
                groupImage.image = UIImage(named: "fotogrupo3")
                groupNameLabel.text = "Recapibaribe"
                
            } else {
                groupImage.image = UIImage(named: "imagemgrupo4")
                groupNameLabel.text = "Recife Limpa"
                
            }
        }
        
        func setupHierarchy(){
            // MARK: - Setup na hierarquia das subviews
            contentView.addSubview(self.groupImage)
            contentView.addSubview(self.groupNameLabel)
        }
        
        func setupAttributes(){
            // Configura a primeira imagem
            groupImage.contentMode = .scaleAspectFit
            
            
            // Configura a label do nome da proposta
            groupNameLabel.translatesAutoresizingMaskIntoConstraints = false
            groupNameLabel.font = UIFont.systemFont(ofSize: 12)
            groupNameLabel.textColor = UIColor(named: "EcoDarkgrey")
            groupNameLabel.textAlignment = .center
            groupNameLabel.numberOfLines = 0
            
        }
        
        func setupConstraints(){
            // Imagem do problema
            groupImage.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                groupImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                groupImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                groupImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                groupImage.heightAnchor.constraint(equalToConstant: 118)
            ])
            
            // Label do nome do problema
            groupNameLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                groupNameLabel.topAnchor.constraint(equalTo: groupImage.bottomAnchor, constant: 10),
                groupNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                groupNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                groupNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                groupNameLabel.heightAnchor.constraint(equalToConstant: 14)
            ])
            
        }
    }
