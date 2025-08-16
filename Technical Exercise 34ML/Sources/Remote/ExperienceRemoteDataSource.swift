//
//  ExperienceRemoteDataSource.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

class ExperienceRemoteDataSource: ExperienceRemoteDataSourceProtocol {
    

    private let apiClient: APIServicesProtocal
    
    init(
        apiClient: APIServicesProtocal = APIService.shared,
    ){
        self.apiClient = apiClient
    }
    
    func fetchRecentExperiences() async throws -> [Experience] {
        let recentExperiences : [Experience] = try await apiClient.request(.recentExperiences)
        return recentExperiences
    }
    
    func fetchRecommendedExperiences() async throws -> [Experience] {
        let recommendedExperiences :  [Experience] = try await apiClient.request(
            .recommendedExperiences
        )
        return recommendedExperiences
    }
    
    func searchExperiences(query: String) async throws -> [Experience] {
        let experiences : [Experience] = try await apiClient.request(
            .searchExperiences(query: query)
        )
        return experiences
    }
    
    func fetchSingleExperience(experienceId: String) async throws -> Experience {
        
        let experienceResponse : Experience = try await apiClient.request(
            .singleExperience(id: experienceId)
        )
        
        return experienceResponse
    }
    
    func likeExperience(experienceId: String) async throws -> Int {
        return try await apiClient.request(.likeExperience(id: experienceId))
    }
}
