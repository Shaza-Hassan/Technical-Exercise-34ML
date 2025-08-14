//
//  ApiResponse.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

struct ApiResponse<T: Codable> : Codable {
    let data: T
    let meta: ApiResponseMeta
}

struct ApiResponseMeta : Codable {
    let count: Int
    let errors: [String]
}
