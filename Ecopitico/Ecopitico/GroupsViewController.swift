//
//  GroupsViewController.swift
//  Ecopitico
//
//  Created by sofia.ribeiro on 13/09/22.
//

import UIKit

class GroupsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "fotosCell", for: indexPath)
        myCell.backgroundColor = .blue
        return myCell
    }
    

//MARK: - Inicialização dos componentes
    let scrollView = UIScrollView()
    let groupNameLabel = UILabel()
    let botaoFavoritar = UIButton()
    let descricaoLabel = UILabel()
    var fotosView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
    let outrasInformacoes = UISegmentedControl(items: ["Contato", "Ações", "Vídeos", "Problemas"])

    
//MARK: - Inicialização das views containers para uso na stack view
    let descricaoContainer = UIView()
    let fotosContainer = UIView()
    let outrasInformacoesContainer = UIView()
    
    // Inicialização da stack view
    let stackView = UIStackView()
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(named: "EcoWhite")
        fotosView.delegate = self
        fotosView.dataSource = self
            setupViewsHierarchy()
            setupViewsAttributes()
            setupConstraints()
        }
        
        func setupViewsHierarchy() {
            // MARK: - Setup na hierarquia das subviews
            // Adiciona a view do background e da stack view como subviews da view raiz
            view.addSubview(scrollView)
            scrollView.addSubview(stackView)
            
            // Adiciona as views à stack view
            stackView.addArrangedSubview(descricaoContainer)
            stackView.addArrangedSubview(fotosContainer)
            stackView.addArrangedSubview(outrasInformacoesContainer)
            
            // Adiciona os componentes aos seus respectivos containers (views)
            descricaoContainer.addSubview(groupNameLabel)
            descricaoContainer.addSubview(botaoFavoritar)
            descricaoContainer.addSubview(descricaoLabel)
            fotosContainer.addSubview(fotosView)
            outrasInformacoesContainer.addSubview(outrasInformacoes)
        }
    
    func setupViewsAttributes() {
        // MARK: - Configuração dos atributos dos componentes
        // Configura a stack view conforme o figma ou necessário
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 100
        
        // Configura a label do nome
        groupNameLabel.translatesAutoresizingMaskIntoConstraints = false
        groupNameLabel.text = "Xô, Plástico!"
        groupNameLabel.font = UIFont.boldSystemFont(ofSize: 32)
        groupNameLabel.textColor = UIColor(named: "EcoGreen")
        groupNameLabel.textAlignment = .left
        groupNameLabel.numberOfLines = 0
        
        // Configura o botão de favoritar
        botaoFavoritar.setImage(UIImage(systemName: "heart"), for: .normal)
        botaoFavoritar.tintColor = UIColor(named: "EcoGreen")
        botaoFavoritar.clipsToBounds = true
        
        
        // Configura a label da descrição
        descricaoLabel.translatesAutoresizingMaskIntoConstraints = false
        descricaoLabel.text = "Somos um movimento de Recife que visa um 🌍 sustentável. Junte-se a nós nas ações de limpeza e na jornada por uma vida eco!"
        descricaoLabel.font = UIFont.systemFont(ofSize: 14)
        descricaoLabel.textColor = UIColor(named: "EcoBlack")
        descricaoLabel.textAlignment = .left
        descricaoLabel.numberOfLines = 0
        
        // Configura a collection view das fotos
        fotosView.backgroundColor = UIColor(named: "EcoWhite")
        fotosView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "fotosCell")
        var layout = UICollectionViewFlowLayout()
        layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        layout.scrollDirection = .horizontal
        fotosView.setCollectionViewLayout(layout, animated: false)
        
        // Configura o segmented control das informações extras
        outrasInformacoes.tintColor = UIColor(named: "EcoGreen")
        //outrasInformacoes.frame = CGRect(x: 0, y: 0, width: 48, height: 22)
    }
    
    func setupConstraints() {
        // MARK: - Configuração das constraints de auto layout
        
        // Scroll view
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          scrollView.topAnchor.constraint(equalTo: view.topAnchor),
          scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
          scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
          scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        // Stack view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // Nome do grupo
        groupNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            groupNameLabel.topAnchor.constraint(equalTo: descricaoContainer.topAnchor),
            groupNameLabel.trailingAnchor.constraint(equalTo: descricaoContainer.trailingAnchor, constant: 190),
            groupNameLabel.leadingAnchor.constraint(equalTo: descricaoContainer.leadingAnchor, constant: 16),
            groupNameLabel.bottomAnchor.constraint(equalTo: descricaoContainer.bottomAnchor, constant: 55.78)
        ])
        
        // Botão favoritar
        botaoFavoritar.translatesAutoresizingMaskIntoConstraints = false
        botaoFavoritar.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        NSLayoutConstraint.activate([
            botaoFavoritar.trailingAnchor.constraint(equalTo: descricaoContainer.trailingAnchor, constant: 16),
            botaoFavoritar.leadingAnchor.constraint(equalTo: descricaoContainer.leadingAnchor, constant: 332.02),
            botaoFavoritar.topAnchor.constraint(equalTo: descricaoContainer.topAnchor),
            botaoFavoritar.bottomAnchor.constraint(equalTo: descricaoContainer.bottomAnchor, constant: 55.78)
        ])
        
        // Texto descrição
        descricaoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descricaoLabel.trailingAnchor.constraint(equalTo: descricaoContainer.trailingAnchor, constant: 16),
            descricaoLabel.leadingAnchor.constraint(equalTo: descricaoContainer.leadingAnchor, constant: 16),
            descricaoLabel.topAnchor.constraint(equalTo: descricaoContainer.topAnchor, constant: 142.78),
            descricaoLabel.bottomAnchor.constraint(equalTo: descricaoContainer.bottomAnchor, constant: 131)
        ])
        
        // CollectionView das fotos
        fotosView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.fotosView.topAnchor.constraint(equalTo: self.fotosContainer.topAnchor),
            self.fotosView.leadingAnchor.constraint(equalTo: self.fotosContainer.leadingAnchor, constant: 16),
            self.fotosView.trailingAnchor.constraint(equalTo: self.fotosContainer.trailingAnchor),
            self.fotosView.bottomAnchor.constraint(equalTo: self.fotosContainer.bottomAnchor)
        ])
        
        // Segmented control demais informações
        outrasInformacoes.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            outrasInformacoes.topAnchor.constraint(equalTo: outrasInformacoesContainer.topAnchor),
            outrasInformacoes.bottomAnchor.constraint(equalTo: outrasInformacoesContainer.bottomAnchor),
            outrasInformacoes.leadingAnchor.constraint(equalTo: outrasInformacoesContainer.leadingAnchor, constant: 20),
            outrasInformacoes.trailingAnchor.constraint(equalTo: outrasInformacoesContainer.trailingAnchor)
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
struct GroupsViewController_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            GroupsViewController().showPreview().previewDevice("iPhone SE (3rd generation)")
            GroupsViewController().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
