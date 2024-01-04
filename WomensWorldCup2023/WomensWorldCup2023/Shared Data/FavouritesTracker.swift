//
//  FavouritesTracker.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 03/01/2024.
//

import Foundation
import Observation
import SwiftUI

@Observable class FavouritesTracker {
    var stadiums: [Stadium] = []
    
    func toggleFavourite(for stadium: Stadium) {
        if let index = stadiums.firstIndex(of: stadium) {
            stadiums.remove(at: index)
        } else {
            stadiums.append(stadium)
        }
        
        stadium.isFavourite.toggle()
    }
}
