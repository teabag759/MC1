//
//  CardData.swift
//  MC1
//
//  Created by ram on 3/21/24.
//

import Foundation

struct CardData: Identifiable, Hashable {
    var id = UUID() // 고유 식별자
    var imageName: String
    var textContent: String
    var type: CardType
    
    // Equatable 프로토콜 준수
    static func == (lhs: CardData, rhs: CardData) -> Bool {
        return lhs.id == rhs.id
    }
    
    // Hashable 프로토콜 준수
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
