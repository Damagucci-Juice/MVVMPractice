//
//  Resource.swift
//  OrderingCoffee
//
//  Created by YEONGJIN JANG on 2023/01/11.
//

import Foundation

struct Resource<T: Codable> {
    let baseURL: URL
    var httpMethod: HTTPMethod = .get
    var body: Data? = nil
}
