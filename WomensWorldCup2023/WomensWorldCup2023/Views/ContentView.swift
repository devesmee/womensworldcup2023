//
//  ContentView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 05/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var favouritesTracker = FavouritesTracker()
    
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
        #else
        jsonManager.getCountries()
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
        .environment(favouritesTracker)
        #if FIREBASE
        .environment(firebaseManager)
        #else
        .environment(jsonManager)
        #endif
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willTerminateNotification), perform: { _ in
            favouritesTracker.saveToUserDefaults()
        })
    }
}

#Preview {
    ContentView()
}
