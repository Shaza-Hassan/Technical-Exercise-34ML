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
                let likesNo = try await repo.likeExperience(
                    experienceId: experience.id
                )
                self.experience = experience.updateLikesNo(likesNo)
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
