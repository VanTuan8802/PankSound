//
//  EffectSound.swift
//  PankSound
//
//  Created by Moon Dev on 02/04/2024.
//

import Foundation
struct EffectSound: Codable {
    let id: Int
    let icon, name: String
    let pitch, rate: Int
    let reverb: [Double]?
    let amplify: Int?
    let echo: [Int]?
    let reverse: Bool?
    let filter: [Double]?
    let eq1: [Int]?
    let chorus: [Double]?
    let eq2, eq3, distort: [Int]?
    let autowah, phaser: [Double]?
}
