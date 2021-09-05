//
//  ArticleListVM.swift
//  NewsApp
//
//  Created by Atin Agnihotri on 05/09/21.
//

import Foundation

struct ArticleListVM {
    let articles: [Article]
}

extension ArticleListVM {
    
    var numberInSections: Int {
        1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleVM {
        ArticleVM(self.articles[index])
    }
}
