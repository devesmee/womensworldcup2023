//
//  ViewNavigationTitleColour.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 25/08/2023.
//

import Foundation
import SwiftUI

extension View {

    func navigationBarTitleTextColor(_ color: Color) -> some View {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(color)]
            
       return self
    }
}
