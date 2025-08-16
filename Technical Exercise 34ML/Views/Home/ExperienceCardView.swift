//
//  ExperienceCardView.swift
//  Technical Exercise 34ML
//
//  Created by Shaza Hassan on 15/08/2025.
//

import SwiftUI

struct ExperienceCardView: View {
    let experience : Experience
    let fullWidth: Bool
    @State private var imageLoaded : Bool = false
    let screenWidth = UIScreen.main.bounds.width
    private let screenRation = 0.91
    let onLike: () -> Void
    var body: some View {
        VStack(spacing:10) {
            coverImage()

            
            HStack{
                Text(experience.title)
                    .font(.GothamRounded.bold(14))
                Spacer()
                Text("\(experience.likesNo)")
                    .font(.GothamRounded.medium(14))
                
                Button(action: {
                    onLike()
                }) {
                    Image(
                        experience.isLiked == true ?
                        AppImages.filledHeart.rawValue :
                            AppImages.emptyHeart.rawValue
                    )
                }.disabled(experience.isLiked == true)
                
            }
            .padding(.leading, 3)
        }
        .frame(
            idealWidth: fullWidth ? .infinity : screenWidth * screenRation,
            maxWidth: fullWidth ? .infinity : screenWidth * screenRation,
        )
    }
    
    fileprivate func coverImage() -> some View {
        return ZStack {
            AsyncImage(url: URL(string: experience.coverPhoto)){ image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(
                        idealWidth: fullWidth ? .infinity : screenWidth * screenRation,
                        maxWidth: fullWidth ? .infinity : screenWidth * screenRation,
                        idealHeight: 154,
                        maxHeight: 154,
                        alignment: .center
                    )
                    .clipped()
                    .onAppear {
                        imageLoaded = true
                    }
                
                
            } placeholder: {
                ProgressView()
                
            }
            
            if imageLoaded {
                Image(AppImages.icon360.rawValue)
                
                VStack{
                    topInfoInCard()
                    Spacer()
                    bottomInfoInCard()
                }
                .padding(10)
            }
        }
        .frame(
            idealWidth: fullWidth ? .infinity : screenWidth * screenRation,
            maxWidth: fullWidth ? .infinity : screenWidth * screenRation,
            idealHeight: 154,
            maxHeight: 154,
        )
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    fileprivate func topInfoInCard() -> some View {
        return HStack{
            if experience.recommended == 1 {
                Label(
                    "RECOMMENDED",
                    image: AppImages.recommended.rawValue
                )
                .padding(.horizontal, 6)
                .padding(.vertical,4)
                .font(.GothamRounded.bold(10))
                .background(.recommendedBackground)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            Spacer()
            
            Image(AppImages.info.rawValue)
        }
    }
    
    fileprivate func bottomInfoInCard() -> some View {
        return HStack{
            Label(
                "\(experience.viewsNo)",
                image: AppImages.views.rawValue
            )
            .font(.GothamRounded.bold(14))
            .foregroundColor(.white)
            
            Spacer()
            
            Image(AppImages.multipeImages.rawValue)
        }
    }
}

#Preview {
    VStack{
        ExperienceCardView(
            experience: dummyExperience, fullWidth: false, onLike: {}
        )
        
        ExperienceCardView(
            experience: dummyExperience, fullWidth: true,onLike: {}
        )
    }
    .padding()
}
