//
//  ExperienceRepoProtocol.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 16/08/2025.
//

import Foundation

protocol ExperienceRepoProtocol {
    func likeExperience(experience: Experience) async throws -> Experience
}
