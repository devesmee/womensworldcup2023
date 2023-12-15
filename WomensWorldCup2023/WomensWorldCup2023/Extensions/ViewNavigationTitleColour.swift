//
//  ViewNavigationTitleColour.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 25/08/2023.
//

import Foundation
import SwiftUI

extension View {

    func setNavigationTitleColour() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("Blue"))]
    }
}
