//
//  ArticleListViewCell.swift
//  1.NewsApp+Combine
//
//  Created by Jeongwan Kim on 2022/07/24.
//

import UIKit

import SnapKit

class ArticleListViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}
