//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by Карина Дудка on 17.10.2022.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

 static let identifire = "TitleTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titlePosterUIImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView?.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
        
    }()

    override init(style:UITableViewCell.CellStyle, reuseIdentifire: String?) {
        super.init(style: styel, reuseIdentifire: reuseIdentifire)
        contentView.addSubview(titlePosterUIImageView)
        contentView.addSubview(titleLabel)

}
    required init(coder: NSCoder) {
        fatalError()
    }

}
