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
    
    @Published var screen: ScreenType = .defualtScreen
    @Published var searchText: String = ""
    @Published var recommendedExperiences: [Experience] = []
    @Published var recentExperiences: [Experience] = []
    
    init(repo: HomeRepoProtocol) {
        self.repo = repo
    }
    
    func fetchRecommendedExperiences() {
        Task {
            do {
                let experiences = try await self.repo.fetchRecommendedExperiences()
                self.recommendedExperiences = experiences
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchRecentExperiences() {
        Task {
            do {
                let experiences = try await self.repo.fetchRecentExperiences()
                recentExperiences = experiences
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
