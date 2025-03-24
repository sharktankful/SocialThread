//
//  SocialThreadApp.swift
//  SocialThread
//
//  Created by Alec Smith on 3/19/25.
//

import SwiftUI

@main
struct SocialThreadApp: App {
    @StateObject var profileModel = ProfileModel()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(profileModel)
        }
    }
}
