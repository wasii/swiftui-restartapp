//
//  HomeView.swift
//  RestartApp
//
//  Created by NaheedPK on 30/03/2022.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            //MARK: - HEADER
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 15 : -15)
                .animation(Animation.easeInOut(duration: 3).repeatForever(), value: isAnimating)
            }
            //MARK: - CENTER
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            //MARK: - FOOTER
            Spacer()
            if #available(iOS 15.0, *) {
                Button(action: {
                    withAnimation(Animation.easeOut(duration: 0.4)) {
                        playSound(sound: "success", type: "m4a")
                        isOnboardingViewActive = true // changing value of userdefaults
                    }
                }) {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                }// - BUTTON
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            } else {
                // Fallback on earlier versions
                Button(action: {
                    withAnimation(Animation.easeOut(duration: 0.4)) {
                        playSound(sound: "success", type: "m4a")
                        isOnboardingViewActive = true // changing value of userdefaults
                    }
                }) {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                }//
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.isAnimating = true
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
