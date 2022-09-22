//
//  Grupo.swift
//  Ecopitico
//
//  Created by jpbol on 21/09/22.
//

import Foundation

struct Grupo {
    let nome: String
    var isLiked = false
    let descricao: String
    let imagens: [String]
    let redesSocias: [String]
    //Aqui era pra ter eventos...
    
    static func GetAllGroups() -> [Grupo] {
        return [
            Grupo(nome: "Xô, Plástico!", descricao: "Somos um movimento de Recife que visa um 🌍 sustentável. Junte-se a nós nas ações de limpeza e na jornada por uma vida eco!", imagens: ["Foto xô plástico", "Foto xô plástico1"], redesSocias: ["https://www.instagram.com/xoplastico/", "https://twitter.com/xoplastico", "https://www.facebook.com/xoplastico/"])
            
        ]
    }
    
}
