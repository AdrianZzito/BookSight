//
//  WindowSelectorView.swift
//  BooksVisualized
//
//  Created by Adrián Castilla on 22/6/23.
//

import SwiftUI

enum windows: String, CaseIterable {
    case allBooks = "book"
    case favourites = "star"
    
    var image: String {
        switch self {
        case .allBooks: return "book.fill"
        case .favourites: return "star.fill"
        }
    }
    
}

struct WindowSelectorView: View {
    
    @Binding var selectedValue: windows
    
    var body: some View {
        
        Picker("Window selector", selection: $selectedValue) {
            ForEach(windows.allCases, id: \.self) { selected in
                Image(systemName: selected == selectedValue ? selected.image:selected.rawValue )
            }
        }
        .pickerStyle(.segmented)
        .frame(width: 120, height: 50)
        
    }
}

#Preview {
    WindowSelectorView(selectedValue: .constant(.allBooks))
}
