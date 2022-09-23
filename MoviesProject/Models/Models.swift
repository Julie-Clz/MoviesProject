//
//  Movies.swift
//  MoviesProject
//
//  Created by Julie Collazos on 16/02/2022.
//

import Foundation


// Enum pour limiter le genre de film possible qu'on lie au model Movie et au model User
enum Genre: String {
    case thriller = "Thriller"
    case romantic = "Romantique"
    case action = "Action"
    case drama = "Drame"
}

// Model des films
struct Movie: Identifiable {
    var id = UUID()
    var title: String
    var director: String
    var image: String
    var pitch: String
    var year: Int
    var genre: Genre
    var isFavorite: Bool
}



// Model du user
struct User: Identifiable {
    var id = UUID()
    var name: String
    var avatar: String
    var birthDate: String
    var description: String
    var preferedGenre: [Genre]
}
