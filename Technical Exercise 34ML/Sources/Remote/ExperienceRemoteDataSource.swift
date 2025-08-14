//
//  ExperienceRemoteDataSource.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

class ExperienceRemoteDataSource: ExperienceRemoteDataSourceProtocol {
    private let apiClient: APIService = APIService.shared
    
    func fetchExperience(experienceId: String) async throws -> Experience {
        
        let experienceResponse : Experience = try await apiClient.request(
            .likeExperience(id: experienceId)
        )
        
        return experienceResponse
    }
}
