//
//  testeSofia2ViewController.swift
//  Ecopitico
//
//  Created by sofia.ribeiro on 16/09/22.
//

import UIKit

class testeSofia2ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "problemasCell", for: indexPath)
        myCell.backgroundColor = .blue
        return myCell
    }

// MARK: - Inicialização dos componentes
    let scrollView = UIScrollView()
    let firstImage = UIImageView()
    let propostaNameLabel = UILabel()
    let fotoPolítico = UIImageView()
    let descricaoProposta = UILabel()
    let propostaIntegra = UIButton()
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
        
        
    }
    
    func setupViewsAttributes(){
        // Configura a primeira imagem
        firstImage.image = UIImage(named: "imagemproposta1")
        firstImage.contentMode = .scaleToFill
        
        // Configura a label do nome
        propostaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        propostaNameLabel.text = "Limpeza do Rio Capibaribe"
        propostaNameLabel.font = UIFont.boldSystemFont(ofSize: 32)
        propostaNameLabel.textColor = UIColor(named: "EcoGreen")
        propostaNameLabel.textAlignment = .left
        propostaNameLabel.numberOfLines = 0
        
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
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
        
        // Primeira imagem
        firstImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        firstImage.topAnchor.constraint(equalTo: view.topAnchor),
        firstImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        firstImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        firstImage.heightAnchor.constraint(equalToConstant: 242.24)
        ])
        
        // Label do nome
        propostaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        propostaNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 354),
        propostaNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
        propostaNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        propostaNameLabel.heightAnchor.constraint(equalToConstant: 88)
        ])
        
        // CollectionView dos problemas
        problemasAssociadosView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.problemasAssociadosView.topAnchor.constraint(equalTo: view.topAnchor, constant: 814),
            self.problemasAssociadosView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            self.problemasAssociadosView.heightAnchor.constraint(equalToConstant: 146)
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
