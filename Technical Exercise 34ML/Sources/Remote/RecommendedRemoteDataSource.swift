//
//  RecommendedRemoteDataSource.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

class RecommendedRemoteDataSource: RecommendedRemoteDataSourceProtocol {
    
    private let apiClient: APIService = APIService.shared
    
    func fetchRecommendedExperiences() async throws -> [Experience] {
        let recommendedExperiences :  [Experience] = try await apiClient.request(
            .recommendedExperiences
        )
        return recommendedExperiences
    }
}
