//
//  problem.swift
//  Ecopitico
//
//  Created by vivi on 14/09/22.
//

import Foundation

struct Problem{
    let name: String
    let type: String
    let img: String
    
    static func GetAllProblems() -> [Problem] {
        return [
            Problem(name: "Expansão Urbana", type: "Grupos", img: "mainImage1"),
            Problem(name: "Emissão de efluentes domésticos", type: "Grupos", img: "mainImage2"),
            Problem(name: "Processos Erosivos", type: "Problemas", img: "mainImage3"),
            Problem(name: "Degradação da vegetação", type: "Problemas", img: "mainImage1"),
            Problem(name: "Deposição de lixo", type: "Problemas", img: "mainImage1"),
            Problem(name: "Agricultura de subsistência", type: "Problemas", img: "mainImage1"),
            Problem(name: "Aterro nos manguezais", type: "Propostas", img: "mainImage1"),
            Problem(name: "Morte do Manguezal", type: "Propostas", img: "mainImage1")
        ]
    }
}
