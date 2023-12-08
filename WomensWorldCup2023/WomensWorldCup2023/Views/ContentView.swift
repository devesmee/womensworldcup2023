//
//  ContentView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

import SwiftUI

struct ContentView: View {
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
            /*AugmentedRealityView()
                .tabItem {
                    Label("AR", systemImage: "camera.viewfinder")
                }*/
            FavouritesOverviewView()
                .tabItem {
                    Label("Favourites", systemImage: "heart.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
