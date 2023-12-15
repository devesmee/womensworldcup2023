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

    var sortedByDate: [Match] {
        sorted(by: { $0.date < $1.date })
    }

    var sortedUniqueDates: [Date] {
        let allDates = map({ $0.date })

        var uniqueDates = self.getUniqueDates(dates: allDates)
        uniqueDates.sort(by: { $0.timeIntervalSince1970 < $1.timeIntervalSince1970 })

        return uniqueDates
    }

    private func getUniqueDates(dates: [Date]) -> [Date] {
        var uniqueDates: [Date] = []

        dates.forEach { date in
            guard !uniqueDates.contains(date) else { return }
            uniqueDates.append(date)
        }

        return uniqueDates
    }

    func forDate(date: Date) -> [Match] {
        self.filter({ $0.date == date })
    }
}
