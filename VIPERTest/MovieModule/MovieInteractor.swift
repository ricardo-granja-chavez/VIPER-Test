//
//  MovieInteractor.swift
//  VIPERTest
//
//  Created by Ricardo Granja Chávez on 19/04/22.
//

import Foundation

class MovieInteractor: PresenterToInteractorMovieProtocol {
    
    var presenter: InteractorToPresenterMovieProtocol?
    
    func fetchMovie() {
        let jsonString = """
        [
            {
              "id": "0",
              "title": "Obligations or Duties",
              "brief": "Notice9 is the legal concept describing a requirement that a party be aware of legal process affecting their rights, obligations or duties.",
              "image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjeZXEh4CeGqb1iVuYNXTjcMYZUEmoYNCZVEVMl0VeqeLDO1Li"
            },
            {
              "id": "1",
              "title": "Gstatic.com",
              "brief": "Notice1 is the legal concept describing a requirement that a party be aware of legal process affecting their rights, obligations or duties.",
              "image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdDUVyLq5PVc_3AYZeGuIsw7L_bRSYAC6Q5XfADVwUcmEPcVby"
            },
            {
              "id": "2",
              "title": "Wikipedia",
              "brief": "Notice2 is the legal concept describing a requirement that a party be aware of legal process affecting their rights, obligations or duties.",
              "image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTor2uiH32YGtD2MNIRtWi5BzEkLZE-I4gGCQ9noAVqj-md1WEZ1A"
            },
            {
              "id": "3",
              "title": "Encrypted-tbn0",
              "brief": "Notice3 is the legal concept describing a requirement that a party be aware of legal process affecting their rights, obligations or duties.",
              "image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY9MnKcPJQSBx69QeFcbIgYTRjh47Pc57nQ1E_QjSOiGRusCqy-A"
            },
            {
              "id": "4",
              "title": "Maxres Default",
              "brief": "Notice4 is the legal concept describing a requirement that a party be aware of legal process affecting their rights, obligations or duties.",
              "image_url": "https://i.ytimg.com/vi/H3lISeLbQl4/maxresdefault.jpg"
            },
            {
              "id": "5",
              "title": "Upload.wikimedia",
              "brief": "Notice5 is the legal concept describing a requirement that a party be aware of legal process affecting their rights, obligations or duties.",
              "image_url": "https://upload.wikimedia.org/wikipedia/en/5/53/Bogan_2017_poster.jpg"
            },
            {
              "id": "6",
              "title": "Bogan_2017",
              "brief": "Notice6 is the legal concept describing a requirement that a party be aware of legal process affecting their rights, obligations or duties.",
              "image_url": "https://upload.wikimedia.org/wikipedia/en/5/53/Bogan_2017_poster.jpg"
            },
            {
              "id": "7",
              "title": "Movie-posters",
              "brief": "Notice7 is the legal concept describing a requirement that a party be aware of legal process affecting their rights, obligations or duties.",
              "image_url": "http://goodmovieslist.com/best-movies/movie-posters/tt0468569.jpg"
            },
            {
              "id": "8",
              "title": "Tbn0.gstatic",
              "brief": "Notice8 is the legal concept describing a requirement that a party be aware of legal process affecting their rights, obligations or duties.",
              "image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBu0mIF2ZYFqg-IgdudOsEz2LdoV7blXaxp8zFF1buUyqXR2jYHQ"
            },
            {
              "id": "9",
              "title": "Obligations or Duties",
              "brief": "Notice9 is the legal concept describing a requirement that a party be aware of legal process affecting their rights, obligations or duties.",
              "image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjeZXEh4CeGqb1iVuYNXTjcMYZUEmoYNCZVEVMl0VeqeLDO1Li"
            },
            {
              "id": "10",
              "title": "Encrypted-tbn0",
              "brief": "Notice10 is the legal concept describing a requirement that a party be aware of legal process affecting their rights, obligations or duties.",
              "image_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgYn_m5u1Gi2Ifo7A-aSlNfHQ0xeOXK_8efbMtnvu4sbnrYh4r"
            }
          ]
        """
        let jsonData = Data(jsonString.utf8)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            do {
                let movies: [MovieModel] = try JSONDecoder().decode([MovieModel].self, from: jsonData)
                self.presenter?.movieFetchSuccess(movieList: movies)
            } catch {
                self.presenter?.movieFetchFailed()
            }
        }
    }
}
