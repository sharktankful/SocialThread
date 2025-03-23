//
//  TabView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/20/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            AboutView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                }
        }
        .accentColor(.white)
    }
}

#Preview {
    TabBarView()
}
