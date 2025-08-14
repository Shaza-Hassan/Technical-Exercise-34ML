//
//  HomeViewModel.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import Foundation

@MainActor
class HomeViewModel : ObservableObject {
    private let repo: HomeRepoProtocol
    
    init(repo: HomeRepoProtocol) {
        self.repo = repo
    }
    
    func fetchRecommendedExperiences() {
        Task {
            do {
                let experiences = try await self.repo.fetchRecommendedExperiences()
                print("recommend: \(experiences)")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchRecentExperiences() {
        Task {
            do {
                let experiences = try await self.repo.fetchRecentExperiences()
                print("recent: \(experiences)")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
