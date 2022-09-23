//
//  MoviesList.swift
//  MoviesProject
//
//  Created by Julie Collazos on 16/02/2022.
//

import SwiftUI

struct MoviesList: View {
    // var d'état pour afficher la modale (bool)
    @State private var isAddMoviePresented = false
    // var d'état pour écouter ce que l'utilisateur tape dans la barre de recherche
    @State private var searchText = ""
    // var d'état pour afficher les résultats de la recherche en live
    @State var searchMovies = movies
    
    var body: some View {
        NavigationView {
            // liste des films 
            List(searchMovies) { movie in
                NavigationLink(destination: {
                    MovieDetail(movie: movie)
                }, label: {
                    HStack {
                        Image(systemName: "film")
                            .foregroundColor(Color("purpleUgly"))
                        Text(movie.title)
                            .padding(.vertical)
                            .padding(.leading)
                        Text(String("(\(movie.year))"))
                            .font(.caption)
                    }
                    
                })
            }
//             barre de recherche
            .searchable(text: $searchText, placement:  .navigationBarDrawer(displayMode: .always),
                prompt: "Titre de film")
            .onChange(of: searchText.lowercased()) { movie in
                if !movie.isEmpty {
                    searchMovies = movies.filter { $0.title.lowercased().contains(movie) }
                } else {
                    searchMovies = movies
                }
            }
            // titre de l'écran
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
            // bouton dans la barre de navigation pour afficher la modale
            .navigationBarItems(
                trailing:
                    Button(action: {
                        isAddMoviePresented.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                // appel de la modale avec la var d'état de type bool
                    .sheet(isPresented: $isAddMoviePresented, content: {
                        AddMovie(movies: $searchMovies)
                    })
            )
        }
        
    }
}


struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesList()
    }
}
