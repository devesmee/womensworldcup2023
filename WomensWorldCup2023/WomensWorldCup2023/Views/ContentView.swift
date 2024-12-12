//
//  ContentView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 05/07/2023.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    #if FIREBASE
    @State private var firebaseManager = FirebaseManager()
    #else
    @State private var jsonManager = JSONManager()
    #endif

    init() {
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        #if FIREBASE
        firebaseManager.getCountries()
        firebaseManager.getMatches()
        firebaseManager.getStadiums()
        #else
        jsonManager.getCountries()
        jsonManager.getMatches()
        jsonManager.getStadiums()
        #endif
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
        #if FIREBASE
        .environment(firebaseManager)
        #else
        .environment(jsonManager)
        #endif
    }
}

#Preview {
    ContentView()
}
