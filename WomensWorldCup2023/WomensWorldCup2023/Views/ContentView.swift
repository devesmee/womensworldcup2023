//
//  ContentView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 05/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var favouritesTracker = FavouritesTracker()

    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }

    var body: some View {
        TabView {
            MatchesOverviewView()
                .tabItem {
                    Label("Matches", systemImage: "soccerball")
                }
            GroupsOverviewView()
                .tabItem {
                    Label("Groups", systemImage: "list.number")
                }
            TeamsOverviewView()
                .tabItem {
                    Label("Teams", systemImage: "tshirt")
                }
            StadiumMapView()
                .tabItem {
                    Label("Stadiums", systemImage: "sportscourt")
                }
            FavouritesOverviewView()
                .tabItem {
                    Label("Favourites", systemImage: "heart.fill")
                }
        }
        .environment(favouritesTracker)
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willTerminateNotification), perform: { _ in
            favouritesTracker.saveToUserDefaults()
        })
    }
}

#Preview {
    ContentView()
}
