//
//  Profil.swift
//  MoviesProject
//
//  Created by Julie Collazos on 16/02/2022.
//

import SwiftUI

struct Profil: View {
    @State var user: User
    @State var movies: [Movie]
    
    var body: some View {
        NavigationView {
            // Infos du user
            VStack {
                Image(user.avatar)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 180, alignment: .center)
                    .shadow(color: .gray, radius: 5, x: 3, y: 3)
                    .padding()
                Text("@\(user.name)")
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
                Text(user.birthDate)
                    .padding()
                    .font(.callout)
                Text(user.description)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .padding(.vertical)
                
                Spacer()
                // Genres préférés du user (C'est un tableau donc on itère dessus)
                List {
                    Section("Genres préférés") {
                        HStack {
                            ForEach(user.preferedGenre, id: \.self) { genre in
                                if genre != user.preferedGenre.last {
                                    Text("\(genre.rawValue),")
                                } else {
                                    Text("\(genre.rawValue)")
                                }
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                    .headerProminence(.increased)
                    
                    // Titres des films favoris du user
                    Section("Films préférés") {
                        VStack {
                            ForEach(movies) { movie in
                                if movie.isFavorite == true {
                                    HStack {
                                        Text(movie.title)
                                    }
                                }
                            }
                        }
                    }
                    .headerProminence(.increased)
                }
            }
            .navigationTitle("Profil")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        Profil(user: user, movies: movies)
    }
}
