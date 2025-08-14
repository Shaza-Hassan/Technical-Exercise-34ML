//
//  SearchExperienceRemoteDataSourceProtocol.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

protocol SearchExperienceRemoteDataSourceProtocol {
    func searchExperiences(query: String) async throws -> [Experience]
}
