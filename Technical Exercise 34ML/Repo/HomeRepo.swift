//
//  HomeRepo.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

class HomeRepo : HomeRepoProtocol{
    
    private let experienceRemoteDataSource : ExperienceRemoteDataSourceProtocol
    private let experienceLocalDataSource : ExperienceLocalDataSource
    
    init(
        experienceRemoteDataSource: ExperienceRemoteDataSourceProtocol = ExperienceRemoteDataSource(),
        experienceLocalDataSource: ExperienceLocalDataSource = ExperienceLocalDataSource()
    ) {
        self.experienceRemoteDataSource = experienceRemoteDataSource
        self.experienceLocalDataSource = experienceLocalDataSource
    }
    
    fileprivate func getLiekdDataFromLocalAndMergeWithRemote(
        local: [Experience],
        remote: [Experience]
    ) -> [Experience]{
        let merged = remote.map { remoteExp in
            if let localExp = local.first(where: { $0.id == remoteExp.id }) {
                var updated = remoteExp
                
                if localExp.isLiked == true {
                    updated = remoteExp.updateIsLiked()
                }
                return updated
            } else {
                return remoteExp
            }
        }
        experienceLocalDataSource.saveExperiences(merged)

        return merged
    }
    
    func fetchRecommendedExperiences() async throws -> [Experience] {
        do {
            let remote = try await experienceRemoteDataSource.fetchRecommendedExperiences()
            let local = experienceLocalDataSource.getRecommendedExperiences()
            let updatedRemoteData = getLiekdDataFromLocalAndMergeWithRemote(local: local, remote:remote)
            return updatedRemoteData
        } catch {
            return experienceLocalDataSource.getRecommendedExperiences()
        }
    }
    
    func fetchRecentExperiences() async throws -> [Experience] {
        do {
            let remote = try await experienceRemoteDataSource.fetchRecentExperiences()
            let local = experienceLocalDataSource.getRecentExperiences()
            let updatedRemoteData = getLiekdDataFromLocalAndMergeWithRemote(local: local, remote:remote)
            return updatedRemoteData
        } catch {
            return experienceLocalDataSource.getRecentExperiences()
        }
    }
    
    func fetchSearchExperiences(query: String) async throws -> [Experience] {
        do {
            let remote = try await experienceRemoteDataSource.searchExperiences(query: query)
            let local = experienceLocalDataSource.searchExperiences(
                query: query
            )
            let updatedRemoteData = getLiekdDataFromLocalAndMergeWithRemote(local: local, remote:remote)
            return updatedRemoteData
        } catch {
            return experienceLocalDataSource.searchExperiences(query: query)
        }
    }
    
    func likeExperience(experience: Experience) async throws -> Experience {
        let likesCount = try await experienceRemoteDataSource
            .likeExperience(experienceId: experience.id)
        let updatedExperience = experience.updateLikesNo(likesCount)
        experienceLocalDataSource.saveExperience(updatedExperience)
        
        return updatedExperience
    }
}
