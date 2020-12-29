//
//  MonthsEnum.swift
//  Desafio
//
//  Created by Vinicius Hiroshi Higa on 28/12/20.
//

import Foundation

enum Months: Int, CaseIterable {
    case january = 0
    case february = 1
    case march = 2
    case april = 3
    case may = 4
    case june = 5
    case july = 6
    case august = 7
    case september = 8
    case october = 9
    case november = 10
    case december = 11
    
    var description: String {
        switch self {
        case .january:
            return "janeiro"
        case .february:
            return "fevereiro"
        case .march:
            return "março"
        case .april:
            return "abril"
        case .may:
            return "maio"
        case .june:
            return "junho"
        case .july:
            return "julho"
        case .august:
            return "agosto"
        case .september:
            return "setembro"
        case .october:
            return "outubro"
        case .november:
            return "novembro"
        case .december:
            return "dezembro"
        }
    }
}
