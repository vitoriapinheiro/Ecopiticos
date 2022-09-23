//
//  PropostasFamosasCollectionViewCell.swift
//  Ecopitico
//
//  Created by sofia.ribeiro on 22/09/22.
//

import UIKit

class PropostasFamosasCollectionViewCell: UICollectionViewCell {
    static let identifier = "PropostasFamosasCollectionViewCell"
        
        // MARK: - Inicialização dos componentes
        let propostaFamosaImagem = UIImageView()
        let propostaFamosaLabel = UILabel()
        
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
                propostaFamosaImagem.image = UIImage(named: "imagemproposta1")
                propostaFamosaLabel.text = "Limpeza do Rio Capibaribe"
                
            } else if tipo == 1{
                propostaFamosaImagem.image = UIImage(named: "fotogrupo2")
                propostaFamosaLabel.text = "LimpaRec"
            } else if tipo == 2{
                propostaFamosaImagem.image = UIImage(named: "fotogrupo3")
                propostaFamosaLabel.text = "Recapibaribe"
                
            } else {
                propostaFamosaImagem.image = UIImage(named: "imagemgrupo4")
                propostaFamosaLabel.text = "Recife Limpa"
                
            }
        }
        
        func setupHierarchy(){
            // MARK: - Setup na hierarquia das subviews
            contentView.addSubview(self.propostaFamosaImagem)
            contentView.addSubview(self.propostaFamosaLabel)
        }
        
        func setupAttributes(){
            // Configura a primeira imagem
            propostaFamosaImagem.contentMode = .scaleAspectFit
            
            
            // Configura a label do nome da proposta
            propostaFamosaLabel.translatesAutoresizingMaskIntoConstraints = false
            propostaFamosaLabel.font = UIFont.systemFont(ofSize: 12)
            propostaFamosaLabel.textColor = UIColor(named: "EcoDarkgrey")
            propostaFamosaLabel.textAlignment = .center
            propostaFamosaLabel.numberOfLines = 0
            
        }
        
        func setupConstraints(){
            // Imagem do problema
            propostaFamosaImagem.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                propostaFamosaImagem.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                propostaFamosaImagem.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                propostaFamosaImagem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                propostaFamosaImagem.heightAnchor.constraint(equalToConstant: 118)
            ])
            
            // Label do nome do problema
            propostaFamosaLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                propostaFamosaLabel.topAnchor.constraint(equalTo: propostaFamosaImagem.bottomAnchor, constant: 10),
                propostaFamosaLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                propostaFamosaLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                propostaFamosaLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ])
            
        }
    
}
