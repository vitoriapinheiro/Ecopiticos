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
            return makeEventCell(indexPath)
            
        } else if  collectionView == self.eventosCollectionView {
            return makeFavoriteGroupCell(indexPath)
            
        } else if collectionView == self.gruposFavoritosCollectionView {
            return makeConquistasCell(indexPath)
            
            
        } else{
            return UICollectionViewCell()
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Clicou em uma cell")
    }
    
    fileprivate func makeEventCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = conquistasCollectionView.dequeueReusableCell(withReuseIdentifier: "conquistasCell", for: indexPath) as? ConquistasCollectionViewCell
        cell?.configure(imagem: UIImage(named: "aguinha") ?? UIImage(), lugar: "Lugar")
        return cell ?? UICollectionViewCell()
        
    }
    
    fileprivate func makeFavoriteGroupCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = eventosCollectionView.dequeueReusableCell(withReuseIdentifier: "eventoCell", for: indexPath) as? EventosCollectionViewCell
        cell?.configure(imagem: UIImage(named: "aguinha") ?? UIImage(), lugar: "Renda")
        return cell ?? UICollectionViewCell()
        
    }

    fileprivate func makeConquistasCell(_ indexPath: IndexPath) -> UICollectionViewCell {

        let cell = gruposFavoritosCollectionView.dequeueReusableCell(withReuseIdentifier: "favoritosCell", for: indexPath) as? FavoriteGroupsCollectionViewCell
        cell?.configure(imagem: UIImage(named: "aguinha") ?? UIImage(), lugar: "Descansar")
        return cell ?? UICollectionViewCell()

    }
}



