//
//  RecentRemoteDataSourceProtocol.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

protocol RecentRemoteDataSourceProtocol {
    func fetchRecentExperiences() async throws -> [Experience]
}
