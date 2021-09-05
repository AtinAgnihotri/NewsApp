//
//  Article.swift
//  NewsApp
//
//  Created by Atin Agnihotri on 05/09/21.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
