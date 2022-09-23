//
//  PessoasCollectionView.swift
//  Carapaca App rascunho
//
//  Created by egln on 16/09/22.
//

import UIKit

extension MyProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.conquistasCollectionView {
            return makeConquistasCell(indexPath)
            
        } else if  collectionView == self.eventosCollectionView {
            return makeEventCell(indexPath)
            
        } else if collectionView == self.gruposFavoritosCollectionView {
            return makeFavoriteGroupCell(indexPath)
            
            
        } else{
            return UICollectionViewCell()
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.gruposFavoritosCollectionView{
            return 1
        }
        
        else if collectionView == self.eventosCollectionView{
            return 5
        }
        
        else if collectionView ==  self.conquistasCollectionView{
            return 8
        }
        
        else{
            return 0
        }
        
            
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Clicou em uma cell")
    }
    
    fileprivate func makeEventCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = conquistasCollectionView.dequeueReusableCell(withReuseIdentifier: "conquistasCell", for: indexPath) as? ConquistasCollectionViewCell
        cell?.configure(imagem: UIImage(named: "aguinha") ?? UIImage(), lugar: "")
        if indexPath.item == 0 {
            cell?.configure(imagem: UIImage(named: "evento1") ?? UIImage(), lugar: "")
        }
        else if indexPath.item == 1 {
            cell?.configure(imagem: UIImage(named: "evento2") ?? UIImage(), lugar: "")
        }
        else {
            cell?.configure(imagem: UIImage(named: "eventovazio") ?? UIImage(), lugar: "")
        }
        return cell ?? UICollectionViewCell()
        
    }
    
    fileprivate func makeFavoriteGroupCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = eventosCollectionView.dequeueReusableCell(withReuseIdentifier: "eventoCell", for: indexPath) as? EventosCollectionViewCell
        cell?.configure(imagem: UIImage(named: "fav-xoplastico") ?? UIImage(), lugar: "")
        return cell ?? UICollectionViewCell()
        
    }

    fileprivate func makeConquistasCell(_ indexPath: IndexPath) -> UICollectionViewCell {

        let cell = gruposFavoritosCollectionView.dequeueReusableCell(withReuseIdentifier: "favoritosCell", for: indexPath) as? FavoriteGroupsCollectionViewCell
        if indexPath.item == 0 {
            cell?.configure(imagem: UIImage(named: "conquista2") ?? UIImage(), lugar: "")
        }
        else if indexPath.item == 1 {
            cell?.configure(imagem: UIImage(named: "conquista1") ?? UIImage(), lugar: "")
        }
        else {
            cell?.configure(imagem: UIImage(named: "conquistasecreta") ?? UIImage(), lugar: "")
        }
        return cell ?? UICollectionViewCell()

    }
}



