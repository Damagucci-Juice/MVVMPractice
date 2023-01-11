//
//  ArticleTableViewCell.swift
//  GoodNews
//
//  Created by YEONGJIN JANG on 2023/01/11.
//

import UIKit

final class ArticleTableViewCell: UITableViewCell {

    static var reuseIdentifier: String { String(describing: ArticleTableViewCell.self)}
    
    @IBOutlet
    weak var titlaLabel: UILabel!
    
    @IBOutlet
    weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension ArticleTableViewCell {
    func fill(_ articleVM: ArticleViewModel) {
        titlaLabel.text = articleVM.title
        descriptionLabel.text = articleVM.description
    }
}
