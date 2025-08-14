//
//  ContentView.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 14/08/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {

        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            viewModel.fetchRecommendedExperiences()
            viewModel.fetchRecentExperiences()
        }
    }
}

#Preview {
    ContentView(
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
