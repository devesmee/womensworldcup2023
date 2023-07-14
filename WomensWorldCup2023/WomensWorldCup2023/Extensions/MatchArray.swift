//
//  MatchArray.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 23/06/2023.
//

import Foundation

extension Array where Element == Match {
    var groupStage: [Match] {
        filter { $0.tournamentStage == .groupStage }
    }

    var roundOf16: [Match] {
        filter { $0.tournamentStage == .round16 }
    }

    var quarterFinal: [Match] {
        filter { $0.tournamentStage == .quarterFinal }
    }

    var semiFinal: [Match] {
        filter { $0.tournamentStage == .semiFinal }
    }

    var thirdPlace: [Match] {
        filter { $0.tournamentStage == .thirdPlace }
    }

    var final: [Match] {
        filter { $0.tournamentStage == .final }
    }
}
