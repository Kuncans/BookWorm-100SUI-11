//
//  AddBookView.swift
//  BookWorm-100SUI-11
//
//  Created by Duncan Kent on 16/03/2022.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a reivew") {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                    
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
            
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
