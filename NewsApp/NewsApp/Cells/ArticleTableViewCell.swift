//
//  ArticleTableViewCell.swift
//  NewsApp
//
//  Created by Jeongwan Kim on 2022/05/05.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    // Properties
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    
    // LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}
