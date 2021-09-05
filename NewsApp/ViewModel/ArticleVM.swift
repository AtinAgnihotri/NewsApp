//
//  ArticleVM.swift
//  NewsApp
//
//  Created by Atin Agnihotri on 05/09/21.
//

import Foundation

struct ArticleVM {
    private let article: Article
}

extension ArticleVM {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleVM {
    
    var title: String {
        article.title
    }
    
    var description: String {
        article.description
    }
}
