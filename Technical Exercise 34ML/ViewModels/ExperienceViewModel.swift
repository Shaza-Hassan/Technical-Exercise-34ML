//
//  ExperienceViewModel.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 16/08/2025.
//

import Foundation

@MainActor
class ExperienceViewModel: ObservableObject {
    @Published var experience: Experience
    let repo : ExperienceRepoProtocol
    
    init(experience: Experience, repo: ExperienceRepoProtocol) {
        self.repo = repo
        self.experience = experience
    }
    
    func onLikeButtonCliked() {
        Task {
            do {
                let experience = try await repo.likeExperience(
                    experience: experience
                )
                self.experience = experience
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
