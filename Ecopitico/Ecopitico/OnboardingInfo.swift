//
//  OnboardingInfo.swift
//  Ecopitico
//
//  Created by jpbol on 13/09/22.
//

import Foundation
import UIKit

class OnboardingInfo {
    let titulo: String
    let backgroundImage: UIImage
    let mainImage:UIImage
    let texto: String
    let botaoVisivel: Bool
    
    init (titulo: String, texto: String, botaoVisivel: Bool, backgroundImage: UIImage, mainImage: UIImage){
        self.titulo = titulo
        self.backgroundImage = backgroundImage
        self.mainImage = mainImage
        self.texto = texto
        self.botaoVisivel = botaoVisivel
    }
}
