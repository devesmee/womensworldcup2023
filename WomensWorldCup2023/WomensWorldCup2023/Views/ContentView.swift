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
            StadiumMapView()
                .tabItem {
                    Label("Stadiums", systemImage: "sportscourt")
                }
            ARView()
                .tabItem {
                    Label("AR", systemImage: "camera.viewfinder")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
