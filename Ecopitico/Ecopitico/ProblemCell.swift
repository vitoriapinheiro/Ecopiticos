//
//  ProblemCell.swift
//  Ecopitico
//
//  Created by vivi on 14/09/22.
//

import UIKit

class ProblemCell: UITableViewCell {
    
    let nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    let placeLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        lbl.textAlignment = .right
        
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLbl)
        addSubview(placeLbl)
        
        nameLbl.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nameLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        nameLbl.rightAnchor.constraint(equalTo: placeLbl.leftAnchor).isActive = true
        nameLbl.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        placeLbl.topAnchor.constraint(equalTo: topAnchor).isActive = true
        placeLbl.widthAnchor.constraint(equalToConstant: 120).isActive = true
        placeLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        placeLbl.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
