//
//  RecentRemoteDataSource.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

final class RecentRemoteDataSource: RecentRemoteDataSourceProtocol {
 
    private let apiClient: APIService = APIService.shared

    func fetchRecentExperiences() async throws -> [Experience] {
        let recentExperiences : [Experience] = try await apiClient.request(.recentExperiences)
        return recentExperiences
    }
}
