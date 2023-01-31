//
//  Service.swift
//  JSONAPIs
//
//  Created by Rashad Surratt on 1/27/23.
//

import Foundation

class Service {
    
    static let shared = Service() // singleton
    
    func fetchApps(searchTerm: String, completion: @escaping ([AppsResult], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=i\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }

        // fetch data from internet
        URLSession.shared.dataTask(with: url) { data, resp, err in

            if let err = err {
                print("Couldn't present apps:", err)
                completion([], nil)
                return
            }

            //success
            guard let data = data else { return }

            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                completion(searchResult.results, nil)

            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
                completion([], jsonErr)
            }
        }.resume() // fires off request.
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        //https://rss.applemarketingtools.com/api/v2/us/music/most-played/50/albums.json
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/50/albums.json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
        if let err = err {
            completion(nil, err)
                return
        }
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
                completion(appGroup, nil)
            } catch {
                completion(nil, error)
            }
            
        } .resume()
    }
}
