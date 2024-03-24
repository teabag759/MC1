//
//  CardData.swift
//  MC1
//
//  Created by ram on 3/21/24.
//

import Foundation

struct CardData: Identifiable, Hashable {
    var id = UUID() // 고유 식별자
    var imageName = "photo"
    var textContent: String
    var type=CardType(name: "기본", score: 0)
    var isCompleted = false
    
    
    
    // Equatable 프로토콜 준수
    static func == (lhs: CardData, rhs: CardData) -> Bool {
        return lhs.id == rhs.id
    }
    
    // Hashable 프로토콜 준수
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct CardType {
    var name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
