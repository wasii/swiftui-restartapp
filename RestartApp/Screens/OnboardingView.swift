//
//  OnboardingView.swift
//  RestartApp
//
//  Created by NaheedPK on 30/03/2022.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    //MARK: BODY
    var body: some View {
        VStack(spacing: 20) {
            Text("Onboarding View")
                .font(.largeTitle)
            Button(action: {
                isOnboardingViewActive = false //changing userdefault value
            }) {
                Text("Start")
            }

        } //: VStack
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
