//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by YEONGJIN JANG on 2023/01/11.
//

import Foundation


struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String { article.title }
    
    var description: String { article.description }
}
