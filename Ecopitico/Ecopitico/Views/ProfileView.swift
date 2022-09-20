//
//  ExploreView.swift
//  Carapaca App rascunho
//
//  Created by egln on 19/09/22.
//

import UIKit

class ProfileView: UIView {
    
    
    let viewGreen: UIView = {
        let view = UIView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = UIColor(named: "EcoDarkGreen")
        view.layer.cornerRadius = 00
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewRetangularGreen: UIView = {
        let view = UIView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let title1Label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Meu Perfil"
        label.textColor = UIColor(named: "EcoWhite")
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let title2Label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Rua da Árvore Bonita, 8983, Recife"
        label.textColor = UIColor(named: "EcoWhite")
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
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
        addSubview(viewRetangularGreen)
        addSubview(viewGreen)
        addSubview(title1Label)
        addSubview(title2Label)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            viewGreen.topAnchor.constraint(equalTo: topAnchor),
            viewGreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewGreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewGreen.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            viewRetangularGreen.topAnchor.constraint(equalTo: topAnchor),
            viewRetangularGreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewRetangularGreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewRetangularGreen.bottomAnchor.constraint(equalTo: viewGreen.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            title1Label.leadingAnchor.constraint(equalTo: viewGreen.leadingAnchor, constant: 16),
            title1Label.bottomAnchor.constraint(equalTo: viewGreen.bottomAnchor, constant: -88),
            title1Label.topAnchor.constraint(equalTo: viewGreen.topAnchor, constant: 107),
            title1Label.trailingAnchor.constraint(equalTo: viewGreen.trailingAnchor, constant: -103)
            
        ])
        
        NSLayoutConstraint.activate([
            title2Label.topAnchor.constraint(equalTo: title1Label.bottomAnchor, constant: 11),
            title2Label.leadingAnchor.constraint(equalTo: viewGreen.leadingAnchor, constant: 16),
            title2Label.trailingAnchor.constraint(equalTo: viewGreen.trailingAnchor, constant: -16),
            title2Label.bottomAnchor.constraint(equalTo: viewGreen.bottomAnchor, constant: -55)

        ])
        
        
    }
    
  
}


// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ExploreView_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            ProfileView().showPreview().previewLayout(.fixed(width: 375.0, height: 219.0))
            //            ViewController().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
