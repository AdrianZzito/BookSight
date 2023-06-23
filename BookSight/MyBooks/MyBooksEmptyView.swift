//
//  MyBooksEmptyView.swift
//  BookSight
//
//  Created by Adrián Castilla on 23/6/23.
//

import SwiftUI

struct MyBooksEmptyView: View {
    var body: some View {
        
        VStack {
            
            Image(systemName: "star.fill")
            
            Text("This is your book shelf and it looks empty! Go ahead and add your books in the Search books menu and start traking your progress on your favourite books.")
            
        }
        
    }
}

#Preview {
    MyBooksEmptyView()
}
