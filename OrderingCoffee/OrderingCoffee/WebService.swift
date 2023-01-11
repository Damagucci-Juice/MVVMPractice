//
//  WebService.swift
//  OrderingCoffee
//
//  Created by YEONGJIN JANG on 2023/01/11.
//

import Foundation

final class WebService {
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        var urlRequest = URLRequest(url: resource.baseURL)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data,
                  error == nil,
                  let statusCode = (response as? HTTPURLResponse)?.statusCode
            else { return completion(.failure(.domainError)) }
            
            guard 200..<300 ~= statusCode else { return completion(.failure(.statusCodeError)) }
            
            if let result = try? JSONDecoder().decode(T.self, from: data) {
                //MARK: - 성공시 UI 업데이트되므로 비동기 처리
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
