//
//  RatingView.swift
//  MC1
//
//  Created by ram on 3/27/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            Spacer()
            ForEach(1..<6) { number in
                Button(action: {
                    self.rating = number
                }) {
                    Text("\(number)")
                        .foregroundColor(number == self.rating ? .blue : .gray)
                        .font(.system(size: 25))
                        .padding(5)
                        .overlay(
                            Circle()
                                .stroke(number == self.rating ? Color.blue : Color.gray, lineWidth: 1)
                        )
                }.padding(.horizontal,10)
            }
            Spacer()
        }
    }
}
