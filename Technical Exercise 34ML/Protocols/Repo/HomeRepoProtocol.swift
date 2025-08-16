//
//  HomeRepoProtocol.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

protocol HomeRepoProtocol {
    func fetchRecentExperiences() async throws -> [Experience]
    func fetchRecommendedExperiences() async throws -> [Experience]
    func fetchSearchExperiences(query: String) async throws -> [Experience]
    func likeExperience(experience: Experience) async throws -> Experience
}
