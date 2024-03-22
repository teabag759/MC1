//
//  CardTestView.swift
//  MC1
//
//  Created by ram on 3/21/24.
//

import Foundation
import SwiftUI



struct CardTestView: View {
    var body: some View {
        NavigationView {
            CardGroupView()
                .navigationBarTitle("카드 그룹")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        CardTestView()
    }
}
