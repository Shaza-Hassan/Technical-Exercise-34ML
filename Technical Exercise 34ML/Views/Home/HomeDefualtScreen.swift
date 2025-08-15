//
//  HomeDefualtScreen.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 15/08/2025.
//

import SwiftUI

struct HomeDefualtScreen: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 0){
                Text("Welcome!")
                    .font(.GothamRounded.bold(22))
                    .padding(.horizontal, 18)

                
                Text("Now you can explore any experience in 360 degrees and get all the details about it all in one place.")
                    .font(.GothamRounded.medium(14))
                    .padding(.horizontal, 18)

                
                Text("Recommended Experiences")
                    .font(.GothamRounded.bold(22))
                    .padding(.top, 30)
                    .padding(.horizontal, 18)

                
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack {
                        ForEach(
                            viewModel.recommendedExperiences
                        ) { experience in
                            ExperienceCardView(
                                isRecommended: true,
                                experience: experience,
                                fullWidth: false
                            )
                        }
                    }
                    .padding(.horizontal, 18)

                    
                }.padding(.top, 12)
                
                Text("Most Recent")
                    .font(.GothamRounded.bold(22))
                    .padding(.top, 30)
                    .padding(.horizontal, 18)

                
                LazyVStack(spacing:12) {
                    ForEach(
                        viewModel.recentExperiences
                    ) { experience in
                        ExperienceCardView(
                            isRecommended: false,
                            experience: experience,
                            fullWidth: true
                        )
                    }
                }
                .padding(.horizontal, 18)

            }
        }
        .frame(
            idealWidth: .infinity,
            maxWidth: .infinity,
            idealHeight: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .task {
            viewModel.fetchRecommendedExperiences()
            viewModel.fetchRecentExperiences()
        }
    }
}

#Preview {
    HomeDefualtScreen(
        viewModel: HomeViewModel(
            repo: HomeRepo(
                recommendedRemoteDataSource: RecommendedRemoteDataSource(),
                searchExperienceRemoteDataSource: SearchExperienceRemoteDataSource(),
                recentRemoteDataSource: RecentRemoteDataSource(),
                likeExperienceRemoteDataSource: LikeExperienceRemoteDataSource()
            )
        )
    )
}
