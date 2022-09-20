//
//  ExplorarViewController.swift
//  Carapaca App rascunho
//
//  Created by vivi on 12/09/22.
//

import UIKit

class MyProfileViewController: UIViewController {
    
    let exploreView = ProfileView()
    let scrollView =  UIScrollView()
    let contentView = UIView()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 20
        return stackView
    }()
    
    let stackViewTitle1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    let title3Label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Minhas conquistas"
        label.textColor = UIColor(named: "EcoBlack")
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let verMais1Button: UIButton = {
        let verMais = UIButton()
        verMais.setTitle("ver todas", for: .normal)
        verMais.setTitleColor(UIColor(named: "EcoGrey"), for: .normal)
        verMais.clipsToBounds = true
        return verMais
    }()
    
    
    let conquistasCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ConquistasCollectionViewCell.self, forCellWithReuseIdentifier: ConquistasCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let stackViewTitle2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    let title4Label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Meus eventos"
        label.textColor = UIColor(named: "EcoBlack")
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let verMais2Button: UIButton = {
        let verMais = UIButton()
        verMais.setTitle("ver todos", for: .normal)
        verMais.setTitleColor((UIColor(named: "EcoGrey")), for: .normal)
        verMais.clipsToBounds = true
        return verMais
    }()
    
    let eventosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 150)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(EventosCollectionViewCell.self, forCellWithReuseIdentifier: EventosCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
        
    }()
    
    let stackViewTitle3: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    let title5Label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Meus grupos favoritos"
        label.textColor = UIColor(named: "EcoBlack")
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let verMais3Button: UIButton = {
        let verMais = UIButton()
        verMais.setTitle("ver todos", for: .normal)
        verMais.setTitleColor(UIColor(named: "EcoGrey"), for: .normal)
        verMais.clipsToBounds = true
        return verMais
    }()
    
    let gruposFavoritosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 150)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FavoriteGroupsCollectionViewCell.self, forCellWithReuseIdentifier: FavoriteGroupsCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
        
    }()
    
  //  weak var delegate: DelegateExplorar?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupHierarchy()
        setupConstraints()
    //    setupAdditionalConfiguration()
        
        conquistasCollectionView.delegate = self
        conquistasCollectionView.dataSource = self
        
        eventosCollectionView.delegate = self
        eventosCollectionView.dataSource = self
        
        gruposFavoritosCollectionView.delegate = self
        gruposFavoritosCollectionView.dataSource = self

    }
    
    func setupHierarchy() {
        view.addSubview(exploreView)
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(stackViewTitle1)
        stackView.addArrangedSubview(conquistasCollectionView)
        stackView.addArrangedSubview(stackViewTitle2)
        stackView.addArrangedSubview(eventosCollectionView)
        stackView.addArrangedSubview(stackViewTitle3)
        stackView.addArrangedSubview(gruposFavoritosCollectionView)
        
        stackViewTitle1.addArrangedSubview(title3Label)
        stackViewTitle1.addArrangedSubview(verMais1Button)
        
        stackViewTitle2.addArrangedSubview(title4Label)
        stackViewTitle2.addArrangedSubview(verMais2Button)
        
        stackViewTitle3.addArrangedSubview(title5Label)
        stackViewTitle3.addArrangedSubview(verMais3Button)
        
        
    }
    
    func setupConstraints() {
        exploreView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exploreView.topAnchor.constraint(equalTo: view.topAnchor),
            exploreView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            exploreView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: exploreView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        conquistasCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            conquistasCollectionView.heightAnchor.constraint(equalToConstant: 136)
        ])
        
        eventosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventosCollectionView.heightAnchor.constraint(equalToConstant: 136)
        ])
        
        gruposFavoritosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gruposFavoritosCollectionView.heightAnchor.constraint(equalToConstant: 136)
        ])
        
        view.backgroundColor = .white
    }
    
    /*
    func setupAdditionalConfiguration() {
        
        verMais1Button.addTarget(self, action: #selector(tappedVerMais), for: .touchUpInside)
        verMais2Button.addTarget(self, action: #selector(tappedVerMais), for: .touchUpInside)
        verMais3Button.addTarget(self, action: #selector(tappedVerMais), for: .touchUpInside)
        exploreView.localizacaoButton.addTarget(self, action: #selector(tappedLocalizacao), for: .touchUpInside)
        
     
    }
    
    @objc func tappedVerMais(sender: UIButton) {
        print("Apertou ver mais")
        delegate?.verMais()
        
    }
    */
    
}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ExplorarViewController_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            MyProfileViewController().showPreview().previewDevice("iPhone SE (3rd generation)")
            //            ViewController().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
