//
//  NetworkError.swift
//  OrderingCoffee
//
//  Created by YEONGJIN JANG on 2023/01/11.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case decodingError
    case statusCodeError
    case domainError
}
