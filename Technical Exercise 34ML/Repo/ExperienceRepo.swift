//
//  ExperienceRepo.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 16/08/2025.
//

import Foundation

class ExperienceRepo : ExperienceRepoProtocol {
    private let likeExperienceRemoteDataSource : LikeExperienceRemoteDataSourceProtocol

    init(
        likeExperienceRemoteDataSource: LikeExperienceRemoteDataSourceProtocol
    ) {
        self.likeExperienceRemoteDataSource = likeExperienceRemoteDataSource
    }
    func likeExperience(experienceId: String) async throws -> Int {
        return try await likeExperienceRemoteDataSource.likeExperience(experienceId: experienceId)
    }

    
}
