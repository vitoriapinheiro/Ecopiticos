//
//  ProblemCell.swift
//  Ecopitico
//
//  Created by vivi on 14/09/22.
//

import UIKit

class ProblemCell: UITableViewCell {
    
    let img : UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.heightAnchor.constraint(equalToConstant: 98).isActive = true
        i.widthAnchor.constraint(equalToConstant: 98).isActive = true
        i.contentMode = .scaleAspectFit
        i.layer.cornerRadius = 8
        return i
    }()
    
    let title: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "Nunito-Medium", size: 22)
        lbl.textAlignment = .left
        
        return lbl
    }()
    
    let subtitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "Nunito-Light", size: 16)
        lbl.textAlignment = .left
        
        return lbl
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(img)
        addSubview(title)
        addSubview(subtitle)
        
        img.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        img.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        title.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        title.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: 20).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        
        subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 7).isActive = true
        subtitle.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: 20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
