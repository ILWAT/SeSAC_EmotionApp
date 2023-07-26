//
//  Emotion.swift
//  EmotionApp
//
//  Created by 문정호 on 2023/07/25.
//

import Foundation
import UIKit

enum Emotion: Int, CaseIterable {
    case verryHappy = 1
    case happy, soso, bad, veryBad
}

extension Emotion{
    func getString() -> String {
        switch self{
        case .verryHappy: return "완전 행복 지수"
        case .happy: return "적당 미소 지수"
        case .soso: return "그냥 그냥 지수"
        case .bad: return "좀 속상한 지수"
        case .veryBad: return "많이 슬픈 지수"
        }
    }
}
