//
//  MovieDetail.swift
//  MoviesProject
//
//  Created by Julie Collazos on 16/02/2022
//

import SwiftUI

struct MovieDetail: View {
    @State var movie: Movie
//    @State var favoriteMovies: [Movie]
    var favoriteIcon: String {
        movie.isFavorite ? "heart.fill" : "heart"
    }

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Spacer()
                Button(action: {
//                    addMovieToFavorite()
                    movie.isFavorite.toggle()
                    print(movie.isFavorite)
                }, label: {
                    Image(systemName: favoriteIcon)
                        .font(.title2)
                        .foregroundColor(.red)
                        .padding(.horizontal)
                })
            }
            Text(movie.title.capitalized)
                .font(.title)
                .fontWeight(.heavy)
                .padding()
            Text("by \(movie.director.capitalized)")
                .font(.custom("Chalkduster", size: 18))
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.bottom, 3)
            Text(String(movie.year))
                .italic()
                .font(.callout)
                .padding(.bottom)
            Image(movie.image)
                .resizable()
                .scaledToFit()
            ScrollView(.vertical, showsIndicators: false) {
                Text(movie.genre.rawValue)
                    .italic()
                    .font(.callout)
                    .padding(.top)
                VStack {
                    Text(movie.pitch)
                        .lineSpacing(8)
                        .padding()
                        .multilineTextAlignment(.center)
                }
            }
            

        }
        
    }
//    func addMovieToFavorite() {
//        favoriteMovies.append(movie)
//        print(favoriteMovies)
//    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: movies[0])
    }
}
