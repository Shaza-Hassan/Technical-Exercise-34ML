//
//  APIServicesProtocal.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 16/08/2025.
//

import Foundation

protocol APIServicesProtocal {
    
    func request<T: Codable>(_ endpoint: APIEndpoints) async throws -> T
}
