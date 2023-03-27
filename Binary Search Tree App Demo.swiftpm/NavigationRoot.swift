//
//  NavigationRoot.swift
//  Binary Search Tree Demo
//
//  Created by Bruno De Vivo on 27/03/23.
//

import SwiftUI

@available(iOS 16.1, *)
struct NavigationRoot: View {
    var body: some View {
        NavigationStack{
            ContentView()
        }
    }
}

@available(iOS 16.1, *)
struct NavigationRoot_Previews: PreviewProvider {
    static var previews: some View {
        NavigationRoot()
    }
}
