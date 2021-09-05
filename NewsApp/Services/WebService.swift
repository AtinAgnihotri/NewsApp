//
//  WebService.swift
//  NewsApp
//
//  Created by Atin Agnihotri on 05/09/21.
//

import Foundation

class WebService {
    
    func getArticles(from url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                if let decoded = try? JSONDecoder().decode(ArticleList.self, from: data) {
                    completion(decoded.articles)
                }
            }
        }.resume()
    }
    
}
