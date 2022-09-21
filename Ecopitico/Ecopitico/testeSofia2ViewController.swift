//
//  testeSofia2ViewController.swift
//  Ecopitico
//
//  Created by sofia.ribeiro on 16/09/22.
//

import UIKit

class testeSofia2ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
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
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProblemasCollectionViewCell.identifier, for: indexPath) as! ProblemasCollectionViewCell
        myCell.setup(tipo: indexPath.item)
        return myCell
    }
    
    // MARK: - Inicialização dos componentes
    let firstImage = UIImageView()
    let propostaNameLabel = UILabel()
    let fotoPolitico = UIImageView()
    let nomePolitico = UILabel()
    let descricaoProposta = UILabel()
    let propostaIntegra = UIButton(configuration: .filled())
    let problemasAssociados = UILabel()
    
    let problemasAssociadosView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: 124, height: 146)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        // Configura a collection view dos problemas
        collection.backgroundColor = UIColor(named: "EcoWhite")
        collection.register(ProblemasCollectionViewCell.self, forCellWithReuseIdentifier: ProblemasCollectionViewCell.identifier)
        
        return collection
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "EcoWhite")
        problemasAssociadosView.delegate = self
        problemasAssociadosView.dataSource = self
        
        setupViewsAttributes()
        setupViewsHierarchy ()
        setupConstraints()
        
    }
    
    func setupViewsHierarchy() {
        // MARK: - Setup na hierarquia das subviews
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        contentView.addSubview(self.firstImage)
        contentView.addSubview(self.propostaNameLabel)
        contentView.addSubview(self.fotoPolitico)
        contentView.addSubview(self.nomePolitico)
        contentView.addSubview(self.descricaoProposta)
        contentView.addSubview(self.propostaIntegra)
        contentView.addSubview(self.problemasAssociados)
        contentView.addSubview(self.problemasAssociadosView)
    }
    
    func setupViewsAttributes(){
        // Configura a primeira imagem
        firstImage.image = UIImage(named: "imagemproposta1")
        firstImage.contentMode = .scaleToFill
        
        
        // Configura a label do nome da proposta
        propostaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        propostaNameLabel.text = "Limpeza do Rio Capibaribe"
        propostaNameLabel.font = UIFont.boldSystemFont(ofSize: 32)
        propostaNameLabel.textColor = UIColor(named: "EcoGreen")
        propostaNameLabel.textAlignment = .left
        propostaNameLabel.numberOfLines = 0
        
        // Configura a imagem do político
        fotoPolitico.image = UIImage(named: "imgplt")
        fotoPolitico.contentMode = .scaleAspectFit
        
        // Configura a label com informações sobre o político
        nomePolitico.translatesAutoresizingMaskIntoConstraints = false
        nomePolitico.text = "Por A. da Silva, vereadora do Partido Maneiro"
        nomePolitico.font = UIFont.systemFont(ofSize: 14)
        nomePolitico.textColor = UIColor(named: "EcoDarkgrey")
        nomePolitico.textAlignment = .left
        nomePolitico.numberOfLines = 0
        
        // Configura a label da descrição
        descricaoProposta.translatesAutoresizingMaskIntoConstraints = false
        descricaoProposta.text = "A ação Limpeza no Cabibaribe faz parte de uma iniciativa que nasceu da parceria Partido Maneiro e 50 barqueiros e pescadores de Recife. Com a proposta de conscientizacao local e incentivo à participação na vida ambiental."
        descricaoProposta.font = UIFont.systemFont(ofSize: 14)
        descricaoProposta.textColor = UIColor(named: "EcoDarkgrey")
        descricaoProposta.textAlignment = .left
        descricaoProposta.numberOfLines = 0
        
        // Configura o botão de ver na íntegra
        propostaIntegra.setTitle("Leia a proposta na íntegra!", for: .normal)
        propostaIntegra.setTitleColor(.systemBackground, for: .normal)
        propostaIntegra.tintColor = UIColor(named: "EcoLightGreen")
        
        // Configura a label do nome dos problemas associados
        problemasAssociados.translatesAutoresizingMaskIntoConstraints = false
        problemasAssociados.text = "Problemas Associados"
        problemasAssociados.font = UIFont.boldSystemFont(ofSize: 24)
        problemasAssociados.textColor = UIColor(named: "EcoGreen")
        problemasAssociados.textAlignment = .left
        problemasAssociados.numberOfLines = 0

        
    }
    
    func setupConstraints(){
        
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
        
        // Primeira imagem
        firstImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            firstImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            firstImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            firstImage.heightAnchor.constraint(equalToConstant: 242.24)
        ])
        
        // Label do nome da proposta
        propostaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            propostaNameLabel.topAnchor.constraint(equalTo: firstImage.bottomAnchor, constant: 24),
            propostaNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            propostaNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        ])
        
        // Imagem do político
        fotoPolitico.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fotoPolitico.topAnchor.constraint(equalTo: propostaNameLabel.bottomAnchor, constant: 24),
            fotoPolitico.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -306),
            fotoPolitico.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            fotoPolitico.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Label nome do político
        nomePolitico.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nomePolitico.topAnchor.constraint(equalTo: propostaNameLabel.bottomAnchor, constant: 24),
            nomePolitico.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            nomePolitico.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100)
        ])
        
        // Label descrição da proposta
        descricaoProposta.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descricaoProposta.topAnchor.constraint(equalTo: fotoPolitico.bottomAnchor, constant: 24),
            descricaoProposta.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descricaoProposta.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
        // Botão ver proposta na íntegra
        propostaIntegra.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            propostaIntegra.heightAnchor.constraint(equalToConstant: 45),
            propostaIntegra.topAnchor.constraint(equalTo: descricaoProposta.bottomAnchor, constant: 15),
            propostaIntegra.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            propostaIntegra.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50)
        ])
        
        // Label problemas associados
        problemasAssociados.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            problemasAssociados.topAnchor.constraint(equalTo: propostaIntegra.bottomAnchor, constant: 24),
            problemasAssociados.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        ])
        
        // Collection View dos problemas associados
        problemasAssociadosView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.problemasAssociadosView.topAnchor.constraint(equalTo: self.problemasAssociados.bottomAnchor, constant: 24),
            self.problemasAssociadosView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            self.problemasAssociadosView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.problemasAssociadosView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            self.problemasAssociadosView.heightAnchor.constraint(equalToConstant: 150)
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
// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct View_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            testeSofia2ViewController().showPreview().previewDevice("iPhone 13")
            testeSofia2ViewController().showPreview().previewDevice("iPhone 13").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
