//
//  SearchExperienceRemoteDataSource.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

class SearchExperienceRemoteDataSource: SearchExperienceRemoteDataSourceProtocol {
    
    private let apiClient: APIService = APIService.shared

    func searchExperiences(query: String) async throws -> [Experience] {
        let experiences : [Experience] = try await apiClient.request(
            .searchExperiences(query: query)
        )
        return experiences
    }

    
}
