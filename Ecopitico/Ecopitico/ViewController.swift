//
//  ViewController.swift
//  Ecopitico
//
//  Created by vivi on 12/09/22.
//

import UIKit

class MyTabBarController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarController()
    }
    private func setupTabBarController(){
        let home = UINavigationController(rootViewController: HomeViewController())
        let search = UINavigationController(rootViewController: SearchViewController())
        let profile = UINavigationController(rootViewController: MyProfileViewController())
        
        self.setViewControllers([home, search, profile], animated: false)
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        
        guard let items = tabBar.items else{return}
                
        items[0].image = UIImage(systemName: "house")
        items[0].title = "Início"
        items[1].image = UIImage(systemName: "magnifyingglass")
        items[1].title = "Explorar"
        items[2].image = UIImage(systemName: "person")
        items[2].title = "Perfil"
        self.tabBar.tintColor = UIColor(named: "EcoGreen")
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -0.5)
                tabBar.layer.shadowRadius = 0
                tabBar.layer.shadowColor = UIColor.black.cgColor
                tabBar.layer.shadowOpacity = 0.3
    }
    
}


// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct View_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            MyTabBarController().showPreview().previewDevice("iPhone 13")
            MyTabBarController().showPreview().previewDevice("iPhone 13").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
