//
// HomeView.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.


import SwiftUI

enum ContentCategory : String, CaseIterable {
    case cities = "Cities"
    case hobbies = "Hobbies"
    case books = "Books"
    
}

struct HomeView: View {
    
    @State private var selectedCategory: ContentCategory = .cities
    @State private var searchText: String = ""
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Categories", selection: $selectedCategory) {
                    ForEach(ContentCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                selectedContentView()
            }
            .navigationTitle("Browse")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "Search \(selectedCategory.rawValue)")
        }
    }
    
    @ViewBuilder
    private func selectedContentView() -> some View {
        if selectedCategory == .cities {
            CitiesView(searchText: $searchText)
        } else if selectedCategory == .hobbies {
            HobbiesView(searchText: $searchText)
        } else if selectedCategory == .books {
            BooksView(searchText: $searchText)
        }
    }
    
}

struct BooksView: View {
    
    @Binding var searchText: String
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    var body: some View {
        List {
            ForEach(favorites.filteredBooks(searchText: searchText)) { book in
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(book.bookTitle)
                            .font(.headline)
                        Text(book.bookAuthor)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                    
                    Button {
                        favorites.toggleFavoriteBook(book: book)
                    } label: {
                        Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                            .font(.title3)
                            .foregroundStyle(book.isFavorite ? .red : .gray)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.vertical, 4)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    HomeView()
        .environmentObject(FavoritesViewModel())
}
