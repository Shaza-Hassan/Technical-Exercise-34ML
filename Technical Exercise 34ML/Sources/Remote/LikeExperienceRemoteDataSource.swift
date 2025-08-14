//
//  LikeExperienceRemoteDataSource.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

class LikeExperienceRemoteDataSource: LikeExperienceRemoteDataSourceProtocol {
    
    private let apiClient: APIService = APIService.shared

    func likeExperience(experienceId: String) async throws -> Int {
        return try await apiClient.request(.likeExperience(id: experienceId))
    }
}
