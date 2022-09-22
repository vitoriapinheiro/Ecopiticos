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
        if collectionView == gruposHomeView{
            return 4
        }
        else if collectionView == problemasRecorrentesView{
            return 3
        }
        else {
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == gruposHomeView{
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: GruposHomeCollectionViewCell.identifier, for: indexPath) as! GruposHomeCollectionViewCell
            myCell.setup(tipo: indexPath.item)
            return myCell
        }
        
        else if collectionView == problemasRecorrentesView{
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProblemasRecorrentesCollectionViewCell.identifier, for: indexPath) as! ProblemasRecorrentesCollectionViewCell
            myCell.setup(tipo: indexPath.item)
            return myCell
            
        }
        else {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: PropostasFamosasCollectionViewCell.identifier, for: indexPath) as! PropostasFamosasCollectionViewCell
            myCell.setup(tipo: indexPath.item)
            return myCell
        }
            
    }
    
    // MARK: - Inicialização dos componentes
    let firstLabel = UILabel()
    let famosinhosLabel = UILabel()
    let gruposHomeView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 118, height: 145)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor(named: "EcoWhite")
        collection.register(GruposHomeCollectionViewCell.self, forCellWithReuseIdentifier: GruposHomeCollectionViewCell.identifier)
        
        return collection
    }()
    let linhaCinza = UIImageView()
    let olhadaLabel = UILabel()
    let problemasRecorrentesView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 118, height: 160)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor(named: "EcoWhite")
        collection.register(ProblemasRecorrentesCollectionViewCell.self, forCellWithReuseIdentifier: ProblemasRecorrentesCollectionViewCell.identifier)
        
        return collection
    }()
    let linhaCinza2 = UIImageView()
    let propostasLabel = UILabel()
    let propostasFamosasView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 118, height: 145)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor(named: "EcoWhite")
        collection.register(PropostasFamosasCollectionViewCell.self, forCellWithReuseIdentifier: PropostasFamosasCollectionViewCell.identifier)
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "EcoWhite")
        gruposHomeView.delegate = self
        gruposHomeView.dataSource = self
        problemasRecorrentesView.delegate = self
        problemasRecorrentesView.dataSource = self
        propostasFamosasView.delegate = self
        propostasFamosasView.dataSource = self
        
        setupViewsHierarchy ()
        setupViewsAttributes()
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
        contentView.addSubview(self.problemasRecorrentesView)
        contentView.addSubview(self.linhaCinza2)
        contentView.addSubview(self.propostasLabel)
        contentView.addSubview(self.propostasFamosasView)

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
        olhadaLabel.text = "Problemas mais recorrentes "
        olhadaLabel.font = UIFont.boldSystemFont(ofSize: 24)
        olhadaLabel.textColor = UIColor(named: "EcoDarkgrey")
        olhadaLabel.textAlignment = .left
        olhadaLabel.numberOfLines = 0
        
        // Configura a segunda linha cinza entre collections
        linhaCinza2.translatesAutoresizingMaskIntoConstraints = false
        linhaCinza2.contentMode = .scaleAspectFill
        linhaCinza2.image = UIImage(named: "linhacinza")
        
        // Configura a label das propostas
        propostasLabel.translatesAutoresizingMaskIntoConstraints = false
        propostasLabel.text = "As propostas mais famosas"
        propostasLabel.font = UIFont.boldSystemFont(ofSize: 24)
        propostasLabel.textColor = UIColor(named: "EcoDarkgrey")
        propostasLabel.textAlignment = .left
        propostasLabel.numberOfLines = 0

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
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        // Label ecopiticos
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            firstLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
        
        // Label famosinhos
        famosinhosLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            famosinhosLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 22),
            famosinhosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
        
        // Colection view grupos na home
        gruposHomeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.gruposHomeView.topAnchor.constraint(equalTo: self.famosinhosLabel.bottomAnchor, constant: 10),
            self.gruposHomeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            self.gruposHomeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.gruposHomeView.heightAnchor.constraint(equalToConstant: 145)
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
            olhadaLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
        
        // Colection view problemas na home
        problemasRecorrentesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.problemasRecorrentesView.topAnchor.constraint(equalTo: self.olhadaLabel.bottomAnchor, constant: 10),
            self.problemasRecorrentesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            self.problemasRecorrentesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.problemasRecorrentesView.heightAnchor.constraint(equalToConstant: 160),
        ])
        
        // linha cinza entre collections
        linhaCinza2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            linhaCinza2.topAnchor.constraint(equalTo: problemasRecorrentesView.bottomAnchor, constant: 10),
            linhaCinza2.heightAnchor.constraint(equalToConstant: 1),
            linhaCinza2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            linhaCinza2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        // Label propostas famosas
        propostasLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            propostasLabel.topAnchor.constraint(equalTo: linhaCinza2.bottomAnchor, constant: 22),
            propostasLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
        
        // Colection view problemas na home
        propostasFamosasView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.propostasFamosasView.topAnchor.constraint(equalTo: self.propostasLabel.bottomAnchor, constant: 10),
            self.propostasFamosasView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            self.propostasFamosasView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.propostasFamosasView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            self.propostasFamosasView.heightAnchor.constraint(equalToConstant: 145)
        ])
        
    }
    
}
