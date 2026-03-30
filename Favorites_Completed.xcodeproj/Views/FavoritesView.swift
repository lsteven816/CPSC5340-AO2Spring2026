//
// FavoritesView.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.


import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                            if favorites.favoriteCities.isEmpty &&
                                favorites.favoriteHobbies.isEmpty &&
                                favorites.favoriteBooks.isEmpty {
                                
                                ContentUnavailableView(
                                    "No Favorites Yet",
                                    systemImage: "heart.slash",
                                    description: Text("Favorite cities, hobbies, and books to see them here.")
                                )
                            } else {
                                List {
                                    if !favorites.favoriteCities.isEmpty {
                                        Section("Cities") {
                                            ForEach(favorites.favoriteCities) { city in
                                                HStack {
                                                    Text(city.cityName)
                                                    Spacer()
                                                    Button {
                                                        favorites.toggleFavoriteCity(city: city)
                                                    } label: {
                                                        Image(systemName: "heart.fill")
                                                            .foregroundStyle(.red)
                                                    }
                                                    .buttonStyle(.plain)
                                                }
                                            }
                                        }
                                    }
                                    
                                    if !favorites.favoriteHobbies.isEmpty {
                                        Section("Hobbies") {
                                            ForEach(favorites.favoriteHobbies) { hobby in
                                                HStack {
                                                    Text("\(hobby.hobbyIcon) \(hobby.hobbyName)")
                                                    Spacer()
                                                    Button {
                                                        favorites.toggleFavoriteHobby(hobby: hobby)
                                                    } label: {
                                                        Image(systemName: "heart.fill")
                                                            .foregroundStyle(.red)
                                                    }
                                                    .buttonStyle(.plain)
                                                }
                                            }
                                        }
                                    }
                                    
                                    if !favorites.favoriteBooks.isEmpty {
                                        Section("Books") {
                                            ForEach(favorites.favoriteBooks) { book in
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
                                                        Image(systemName: "heart.fill")
                                                            .foregroundStyle(.red)
                                                    }
                                                    .buttonStyle(.plain)
                                                }
                                            }
                                        }
                                    }
                                }
                                .listStyle(.insetGrouped)
                            }
                        }
                        .navigationTitle("Favorites")
                        .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }


#Preview {
    FavoritesView()
}
