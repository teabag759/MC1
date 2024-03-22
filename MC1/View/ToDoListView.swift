//
//  ToDoListView.swift
//  MC1
//
//  Created by ram on 3/21/24.
//

import Foundation
import SwiftUI
struct ToDoListView: View {
    @Binding var likeDatas: [CardData]
    @Binding var dislikeDatas: [CardData]
    
    var body: some View {
        List {
            Section(header: Text("Like")) {
                ForEach(likeDatas) { data in
                    Text(data.textContent)
                }
            }
            
            Section(header: Text("Dislike")) {
                ForEach(dislikeDatas) { data in
                    Text(data.textContent)
                }
            }
        }
    }
}
