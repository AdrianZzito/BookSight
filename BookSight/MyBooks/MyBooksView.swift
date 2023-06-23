//
//  MyBooksView.swift
//  BooksVisualized
//
//  Created by Adrián Castilla on 23/6/23.
//

import SwiftUI

struct MyBooksView: View {
    
    @State var search = ""
    @State var navigation = false
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        NavigationStack {
            
            if viewModel.myBooks.isEmpty {
                MyBooksEmptyView()
            } else {
                
                ScrollView {
                    
                    LazyVGrid(columns: [GridItem(.fixed(500)), GridItem(.fixed(500)), GridItem(.fixed(500))]) {
                        
                        ForEach(viewModel.myBooks, id: \.self) { myBooks in
                            MyBookRow(book: myBooks)
                                .onTapGesture {
                                    navigation.toggle()
                                }
                                .navigationDestination(isPresented: $navigation) {
                                    BookDetailedView(book: myBooks)
                                }
                            
                            
                        }
                        
                        
                    }
                    .searchable(text: $search)
                    .navigationTitle("My book shelf")
                    .padding(.horizontal, 50)
                    .padding(.vertical)
                    
                }
                
            }
            
        }
        
    }
}

#Preview {
    MyBooksView()
}
