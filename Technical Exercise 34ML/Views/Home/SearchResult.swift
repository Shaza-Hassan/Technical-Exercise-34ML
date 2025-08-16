//
//  SearchResult.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 15/08/2025.
//

import SwiftUI

struct SearchResult: View {
    
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        VStack {
            
            switch viewModel.searchResult {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView()
                
                
            case .loaded(let t):
                if t.isEmpty {
                    Text("No Result Found")
                        .font(.GothamRounded.bold(22))
                        .foregroundColor(.red)
                } else {
                    handleSearchResultView(result: t)
                }
            case .error(let string):
                Text(string)
                    .font(.GothamRounded.bold(22))
                    .foregroundColor(.red)
            }
        }.frame(
            idealWidth: .infinity,
            maxWidth: .infinity,
            idealHeight: .infinity,
            maxHeight: .infinity,
            alignment: .center
        )
    }
    
    
    func handleSearchResultView(result: [Experience]) -> some View {
        ScrollView(.vertical,showsIndicators: false){
            LazyVStack {
                ForEach(result){
                    experience in
                    ExperienceCardView(
                        experience: experience,
                        fullWidth: true,
                        onLike: {
                            viewModel.likeExperience(exp: experience)
                        }
                    )
                    .onTapGesture {
                        viewModel.selectedItem = experience
                    }
                }
            }
            .padding(.horizontal, 18)
            .padding(.top,24)
            
        }
    }
}

#Preview {
    SearchResult(
        viewModel: HomeViewModel(
            repo: HomeRepo(
                
            )
        )
        
    )
}
