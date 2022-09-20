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
        
        return sv
    }()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "problemasCell", for: indexPath)
        myCell.backgroundColor = .blue
        return myCell
    }

// MARK: - Inicialização dos componentes
//    let scrollView = UIScrollView()
    let firstImage = UIImageView()
    let propostaNameLabel = UILabel()
    let fotoPolitico = UIImageView()
    let nomePolitico = UILabel()
    let descricaoProposta = UILabel()
    let propostaIntegra = UIButton(configuration: .filled())
    let problemasAssociados = UILabel()
    let problemasAssociadosView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
    
    
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

        scrollView.addSubview(self.firstImage)
        scrollView.addSubview(self.propostaNameLabel)
        scrollView.addSubview(self.fotoPolitico)
        scrollView.addSubview(self.nomePolitico)
        scrollView.addSubview(self.descricaoProposta)
        scrollView.addSubview(self.propostaIntegra)
        scrollView.addSubview(self.problemasAssociados)
        scrollView.addSubview(self.problemasAssociadosView)

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
        fotoPolitico.image = UIImage(named: "imagemproposta1")
        fotoPolitico.contentMode = .scaleToFill
        
        // Configura a label com informações sobre o político
        nomePolitico.translatesAutoresizingMaskIntoConstraints = false
        nomePolitico.text = "Por A. da Silva, vereador do Partido Maneiro"
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
        
        // Configura a collection view dos problemas
        problemasAssociadosView.backgroundColor = UIColor(named: "EcoWhite")
        problemasAssociadosView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "problemasCell")
                var layout = UICollectionViewFlowLayout()
                layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: 100, height: 100)
                layout.scrollDirection = .horizontal
                problemasAssociadosView.setCollectionViewLayout(layout, animated: false)
                
    }
    
    func setupConstraints(){
        
        // Scroll view
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        scrollView.topAnchor.constraint(equalTo: view.topAnchor),
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor)
            ])
        
        // Primeira imagem
        firstImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        firstImage.topAnchor.constraint(equalTo: view.topAnchor),
        firstImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        firstImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        firstImage.heightAnchor.constraint(equalToConstant: 242.24)
        ])
        
        // Label do nome da proposta
        propostaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        propostaNameLabel.topAnchor.constraint(equalTo: firstImage.bottomAnchor, constant: 24),
        propostaNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        propostaNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        // Imagem do político
        fotoPolitico.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        fotoPolitico.topAnchor.constraint(equalTo: propostaNameLabel.bottomAnchor, constant: 24),
        fotoPolitico.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -306),
        fotoPolitico.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        fotoPolitico.heightAnchor.constraint(equalToConstant: 47)
        ])
        
        // Label nome do político
        nomePolitico.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        nomePolitico.topAnchor.constraint(equalTo: propostaNameLabel.bottomAnchor, constant: 24),
        nomePolitico.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        nomePolitico.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
        ])
        
        // Label descrição da proposta
        descricaoProposta.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descricaoProposta.topAnchor.constraint(equalTo: fotoPolitico.bottomAnchor, constant: 24),
            descricaoProposta.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descricaoProposta.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        // Botão ver proposta na íntegra
        propostaIntegra.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            propostaIntegra.heightAnchor.constraint(equalToConstant: 45),
            propostaIntegra.topAnchor.constraint(equalTo: descricaoProposta.bottomAnchor, constant: 15),
            propostaIntegra.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            propostaIntegra.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
        ])
        
        // Label problemas associados
        problemasAssociados.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            problemasAssociados.topAnchor.constraint(equalTo: propostaIntegra.bottomAnchor, constant: 24),
            problemasAssociados.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        
        // CollectionView dos problemas associados
        problemasAssociadosView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.problemasAssociadosView.topAnchor.constraint(equalTo: self.problemasAssociados.bottomAnchor, constant: 24),
            self.problemasAssociadosView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
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
