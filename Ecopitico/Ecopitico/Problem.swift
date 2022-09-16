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
    
    static func GetAllProblems() -> [Problem] {
        return [
            Problem(name: "Expansão Urbana", type: "Grupos"),
            Problem(name: "Emissão de efluentes domésticos", type: "Grupos"),
            Problem(name: "Processos Erosivos", type: "Problemas"),
            Problem(name: "Degradação da vegetação", type: "Problemas"),
            Problem(name: "Deposição de lixo", type: "Problemas"),
            Problem(name: "Agricultura de subsistência", type: "Problemas"),
            Problem(name: "Aterro nos manguezais", type: "Propostas"),
            Problem(name: "Morte do Manguezal", type: "Propostas")
        ]
    }
}
