//
//  ExperienceRepo.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 16/08/2025.
//

import Foundation

class ExperienceRepo : ExperienceRepoProtocol {
    private let experienceRemoteDataSource : ExperienceRemoteDataSource
    private let experienceLocalDataSource : ExperienceLocalDataSource

    init(
        experienceRemoteDataSource : ExperienceRemoteDataSource = ExperienceRemoteDataSource(),
        experienceLocalDataSource : ExperienceLocalDataSource = ExperienceLocalDataSource()
    ) {
        self.experienceRemoteDataSource = experienceRemoteDataSource
        self.experienceLocalDataSource = experienceLocalDataSource
    }
    
    func likeExperience(experience: Experience) async throws -> Experience {
        let likesCount = try await experienceRemoteDataSource
            .likeExperience(experienceId: experience.id)
        let updatedExperience = experience.updateLikesNo(likesCount)
        experienceLocalDataSource.saveExperience(updatedExperience)
        return updatedExperience
    }

    
}
