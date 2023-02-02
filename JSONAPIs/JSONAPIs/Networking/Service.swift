//
//  Service.swift
//  JSONAPIs
//
//  Created by Rashad Surratt on 1/27/23.
//

import Foundation

class Service {
    
    static let shared = Service() // singleton
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        print("Fetching from service layer")
        
        let urlString = "https://itunes.apple.com/search?term=i\(searchTerm)&entity=software"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
 
    }
    
    func fetchTheApps(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/100/apps.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchPlayedAlbums(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/100/albums.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchMusicVideos(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/100/music-videos.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchPodcasts(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString =  "https://rss.applemarketingtools.com/api/v2/us/podcasts/top/100/podcasts.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchBooks(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/books/top-free/100/books.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchAudioBook(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/audio-books/top/100/audio-books.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) -> Void) {
        
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
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
        let urlString = "https://iosdevrashad.github.io/Data/jsonformatter.json"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // declare generic json function
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        
        print("T is type:", T.self)
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                
                // success
                completion(objects, nil)
            } catch {
                completion(nil, error)
            }
        } .resume()
    }
}


class Stack<T: Decodable> {
    var items = [T]()
    func push(item: T) { items.append(item) }
    func pop() -> T? { return items.last }
}

import UIKit

func dummyFunc() {
    let stackOfStrings = Stack<String>()
    stackOfStrings.push(item: "String required")
    
    let stackOfInts = Stack<Int>()
    stackOfInts.push(item: 1)
}
