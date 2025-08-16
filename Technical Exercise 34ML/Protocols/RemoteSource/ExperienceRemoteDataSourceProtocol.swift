//
//  ExperienceRemoteDataSourceProtocol.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

protocol ExperienceRemoteDataSourceProtocol {
    func fetchRecentExperiences() async throws -> [Experience]
    func fetchRecommendedExperiences() async throws -> [Experience]
    func searchExperiences(query: String) async throws -> [Experience]
    func likeExperience(experienceId: String) async throws -> Int
    func fetchSingleExperience(experienceId: String) async throws -> Experience
}
