//
//  RendaCollectionViewCell.swift
//  Carapaca App rascunho
//
//  Created by egln on 19/09/22.
//

import UIKit

class EventosCollectionViewCell: UICollectionViewCell {

    static let identifier = "eventoCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "trying"
        label.textAlignment = .left
        label.clipsToBounds = true
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 0
        return stackView
    }()
    
    
    
    override init(frame: CGRect) {
           super.init(frame: frame)
        
        setupHierarchy()
        setupConstraints()
   
       }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    func setupHierarchy() {
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
    }
    
    func setupConstraints() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: stackView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: label.topAnchor)
            
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
            
        ])
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = CGRect(x: 0, y: 0, width: 157, height: 113)
        label.frame = CGRect(x: 0, y: 0, width: 157, height: 19)
    }
    
    public func configure(imagem: UIImage, lugar: String) {
        imageView.image = imagem
        label.text = lugar
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct RendaCollectionViewCell_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            EventosCollectionViewCell().showPreview().previewLayout(.fixed(width: 157.0, height: 136.0))
//            ViewController().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif


