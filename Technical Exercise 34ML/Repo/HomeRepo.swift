//
//  HomeRepo.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

class HomeRepo : HomeRepoProtocol{
    
    private let recommendedRemoteDataSource : RecommendedRemoteDataSourceProtocol
    private let searchExperienceRemoteDataSource : SearchExperienceRemoteDataSourceProtocol
    private let recentRemoteDataSource : RecentRemoteDataSourceProtocol
    private let likeExperienceRemoteDataSource : LikeExperienceRemoteDataSourceProtocol
    
    init(
        recommendedRemoteDataSource: RecommendedRemoteDataSourceProtocol,
        searchExperienceRemoteDataSource : SearchExperienceRemoteDataSourceProtocol,
        recentRemoteDataSource : RecentRemoteDataSourceProtocol,
        likeExperienceRemoteDataSource : LikeExperienceRemoteDataSourceProtocol
    ) {
        self.recommendedRemoteDataSource = recommendedRemoteDataSource
        self.likeExperienceRemoteDataSource = likeExperienceRemoteDataSource
        self.recentRemoteDataSource = recentRemoteDataSource
        self.searchExperienceRemoteDataSource = searchExperienceRemoteDataSource
    }
    
    func fetchRecentExperiences() async throws -> [Experience] {
        return try await recentRemoteDataSource.fetchRecentExperiences()
    }
    
    func fetchRecommendedExperiences() async throws -> [Experience] {
        return try await recommendedRemoteDataSource.fetchRecommendedExperiences()
    }
    
    func fetchSearchExperiences(query: String) async throws -> [Experience] {
        return try await searchExperienceRemoteDataSource.searchExperiences(query: query)
    }
    
    func likeExperience(experienceId: String) async throws -> Int {
        return try await likeExperienceRemoteDataSource.likeExperience(experienceId: experienceId)
    }
}
