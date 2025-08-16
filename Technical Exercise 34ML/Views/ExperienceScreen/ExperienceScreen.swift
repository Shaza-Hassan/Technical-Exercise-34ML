//
//  ExperienceScreen.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 16/08/2025.
//

import SwiftUI

struct ExperienceScreen: View {
    @StateObject var viewModel: ExperienceViewModel
    @State private var imageLoaded : Bool = false
    let screenWidth = UIScreen.main.bounds.width

    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 0){
                
                experienceImage()
                
                experienceHeader()
                
                Divider()
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                
                experienceDescription()
                
            }
            
        }
    }
    
    func experienceImage() -> some View {
        ZStack{
            AsyncImage(
                url: URL(string: viewModel.experience.coverPhoto),
                content: {
                    image in
                    image
                        .frame(
                            idealWidth: screenWidth,
                            maxWidth: screenWidth,
                                idealHeight: 285,maxHeight:285)
                        .clipped()
                        .onAppear {
                            imageLoaded = true
                        }
                },
                placeholder: {
                    ProgressView()
                }
            )
            .frame(height: 285)

            if imageLoaded {
                Button(action: {}) {
                    Text("EXPLORE NOW")
                        .font(.GothamRounded.bold(14))
                        .foregroundColor(.orange)
                        .padding()
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                VStack{
                    Spacer()
                    
                    HStack{
                        Label(
                            "\(viewModel.experience.viewsNo) views",
                            image: AppImages.views.rawValue
                        )
                        .font(.GothamRounded.medium(14))
                        .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(AppImages.multipeImages.rawValue)
                        
                    }
                   
                }
                .padding(.horizontal,18)
                .padding(.bottom,18)
                
            }
        }

    }
    
    fileprivate func experienceHeader() -> some View {
        VStack(alignment: .leading) {
            HStack{
                Text(viewModel.experience.title)
                    .font(.GothamRounded.bold(16))
                
                Spacer()
                
                Image(AppImages.share.rawValue)
                
                Button(action: {
                    viewModel.onLikeButtonCliked()
                }) {
                    Image(
                        viewModel.experience.isLiked == true ? AppImages.filledHeart.rawValue :
                            AppImages.emptyHeart.rawValue
                    )
                }.disabled(viewModel.experience.isLiked == true)
                
                Text("\(viewModel.experience.likesNo)")
                    .font(.GothamRounded.medium(14))
                    
            }
            
            Text(viewModel.experience.city.name + ", Egypt")
                .foregroundColor(.textGreyColor)
                .font(.GothamRounded.medium(16))
        }
        .padding(.top,12)
        .padding(.horizontal,18)
        
    }
    
    fileprivate func experienceDescription() -> some View {
        
        VStack(alignment: .leading){
            Text("Description")
                .font(.GothamRounded.bold(22))
            
            Text(viewModel.experience.description)
                .font(.GothamRounded.medium(14))
        }
        .padding(.horizontal,18)
    }
}

#Preview {
    ExperienceScreen(
        viewModel: ExperienceViewModel(
            experience: dummyExperience,
            repo: ExperienceRepo(
                likeExperienceRemoteDataSource: LikeExperienceRemoteDataSource()
            )
        )
        
    )
}
