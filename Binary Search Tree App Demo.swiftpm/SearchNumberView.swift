//
//  SearchNumberView.swift
//  Binary Search Tree Demo
//
//  Created by Bruno De Vivo on 27/03/23.
//

import SwiftUI

@available(iOS 16.1, *)
struct SearchNumberView: View {
    var model : ContentViewViewModel?
    
    var body: some View {
        Text("Insert here the number you're searching for:")
            .font(.system(size: 22))
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
        //TODO: Textarea
    }
}

@available(iOS 16.1, *)
struct SearchNumberView_Previews: PreviewProvider {
    static var previews: some View {
        SearchNumberView()
    }
}
