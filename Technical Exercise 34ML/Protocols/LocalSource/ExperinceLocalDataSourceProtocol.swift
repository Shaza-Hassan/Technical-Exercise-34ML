//
//  ExperinceLocalDataSourceProtocol.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 16/08/2025.
//

import Foundation

protocol ExperienceLocalDataSourceProtocol {
    func saveExperiences(_ experiences: [Experience])
    func getRecommendedExperiences() -> [Experience]
    func getRecentExperiences() -> [Experience]
    func searchExperiences(query: String) -> [Experience]
    func saveExperience(_ experience: Experience)
}
