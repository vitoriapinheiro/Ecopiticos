//
//  HomeViewController.swift
//  Ecopitico
//
//  Created by vivi on 12/09/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: GruposHomeCollectionViewCell.identifier, for: indexPath) as! GruposHomeCollectionViewCell
        myCell.setup(tipo: indexPath.item)
        return myCell
    }
    
    // MARK: - Inicialização dos componentes
    let firstLabel = UILabel()
    let famosinhosLabel = UILabel()
    let gruposHomeView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 118, height: 140)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor(named: "EcoWhite")
        collection.register(GruposHomeCollectionViewCell.self, forCellWithReuseIdentifier: GruposHomeCollectionViewCell.identifier)
        
        return collection
    }()
    let linhaCinza = UIImageView()
    let olhadaLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "EcoWhite")
        gruposHomeView.delegate = self
        gruposHomeView.dataSource = self
        
        setupViewsAttributes()
        setupViewsHierarchy ()
        setupConstraints()
    }
    
    func setupViewsHierarchy() {
        // MARK: - Setup na hierarquia das subviews
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        contentView.addSubview(self.firstLabel)
        contentView.addSubview(self.famosinhosLabel)
        contentView.addSubview(self.gruposHomeView)
        contentView.addSubview(self.linhaCinza)
        contentView.addSubview(self.olhadaLabel)
    }
    
    func setupViewsAttributes() {
        // Configura a label Ecopiticos
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.text = "Ecopiticos"
        firstLabel.font = UIFont.boldSystemFont(ofSize: 34)
        firstLabel.textColor = UIColor(named: "EcoGreen")
        firstLabel.textAlignment = .left
        firstLabel.numberOfLines = 0
        
        // Configura a label famosinhos
        famosinhosLabel.translatesAutoresizingMaskIntoConstraints = false
        famosinhosLabel.text = "Grupos famosinhos"
        famosinhosLabel.font = UIFont.boldSystemFont(ofSize: 24)
        famosinhosLabel.textColor = UIColor(named: "EcoDarkgrey")
        famosinhosLabel.textAlignment = .left
        famosinhosLabel.numberOfLines = 0
        
        // Configura a linha cinza entre collections
        linhaCinza.translatesAutoresizingMaskIntoConstraints = false
        linhaCinza.contentMode = .scaleAspectFill
        linhaCinza.image = UIImage(named: "linhacinza")
        
        // Configura a label olhada
        olhadaLabel.translatesAutoresizingMaskIntoConstraints = false
        olhadaLabel.text = "Você já deu uma olhada"
        olhadaLabel.font = UIFont.boldSystemFont(ofSize: 24)
        olhadaLabel.textColor = UIColor(named: "EcoDarkgrey")
        olhadaLabel.textAlignment = .left
        olhadaLabel.numberOfLines = 0
    }
    
    func setupConstraints() {
        // Scroll view
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        
        // content view
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        // Label ecopiticos
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20),
            firstLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
        
        // Label famosinhos
        famosinhosLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            famosinhosLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 22),
            famosinhosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
        
        // Colection view problemas na home
        gruposHomeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.gruposHomeView.topAnchor.constraint(equalTo: self.famosinhosLabel.bottomAnchor, constant: 10),
            self.gruposHomeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            self.gruposHomeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.gruposHomeView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        // linha cinza entre collections
        linhaCinza.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            linhaCinza.topAnchor.constraint(equalTo: gruposHomeView.bottomAnchor, constant: 10),
            linhaCinza.heightAnchor.constraint(equalToConstant: 1),
            linhaCinza.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            linhaCinza.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        // Label olhada
        olhadaLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            olhadaLabel.topAnchor.constraint(equalTo: linhaCinza.bottomAnchor, constant: 22),
            olhadaLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
        
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
