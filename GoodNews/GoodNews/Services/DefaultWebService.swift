//
//  WebService.swift
//  GoodNews
//
//  Created by YEONGJIN JANG on 2023/01/11.
//

import Foundation

protocol WebService {
    func getArticles(url: URL, completion: @escaping (Result<[Article], Error>) -> Void)
}

final class DefaultWebService: WebService {
    
    func getArticles(url: URL, completion: @escaping (Result<[Article], Error>) -> Void) {
        let request = URLRequest(url: url)
    
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return completion(.failure(error!)) }
            if let articles =  try? JSONDecoder().decode(ArticleList.self, from: data).articles {
                completion(.success(articles))
            }
        }
        task.resume()
    }
}

