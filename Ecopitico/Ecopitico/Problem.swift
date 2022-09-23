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
            Problem(name: "Xô, Plástico!", type: "Grupos", img: "Foto xô plástico"),
            Problem(name: "Recapibaribe", type: "Grupos", img: "Recapibaribe"),
            Problem(name: "Processos Erosivos", type: "Problemas", img: "Voçoroca-em-unidade-de-conservação"),
            Problem(name: "Degradação da vegetação", type: "Problemas", img: "20170728190147136070a"),
            Problem(name: "Deposição de lixo", type: "Problemas", img: "dji_0008-16767654"),
            Problem(name: "Limpeza do Rio Capibaribe", type: "Propostas", img: "image 2"),
            Problem(name: "Reflorestamento", type: "Propostas", img: "20210830-210830-viveiros-nos-mangues-da-amazonia-1")
        ]
    }
}
