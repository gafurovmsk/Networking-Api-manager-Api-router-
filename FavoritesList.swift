//
//  FavoritesList.swift
//  Magic Mirror
//
//  Created by Nik on 31/01/17.
//  Copyright © 2017 Gafurov Z. All rights reserved.
//

import Foundation


class FavoritesList: NSObject {
    
    private var favorites = [FavoritesFetchData]()

    
    override init() {
        super.init()
      
      // test fetching
        
        let some0 = FavoritesFetchData(profileWith: UIImage(named: "fav_\(0).png")!, andProfile: "Светлана Баранова", rating: "1115", likes: "23", followers: "31")
        
        let some1 = FavoritesFetchData(profileWith: UIImage(named: "fav_\(1).png")!, andProfile: "Анастасия Семенова", rating: "1114", likes: "1125", followers: "33")
        
        let some2 = FavoritesFetchData(profileWith: UIImage(named: "fav_\(2).png")!, andProfile: "Ландыш Сагирова", rating: "1113", likes: "123", followers: "1")
        
        let some3 = FavoritesFetchData(profileWith: UIImage(named: "fav_\(3).png")!, andProfile: "Оксана Дугинова", rating: "11", likes: "126", followers: "134")
        
        let some4 = FavoritesFetchData(profileWith: UIImage(named: "fav_\(1).png")!, andProfile: "Анастасия Семенова", rating: "1111", likes: "122", followers: "5667")
        
        let some5 = FavoritesFetchData(profileWith: UIImage(named: "fav_\(0).png")!, andProfile: "Августа Лавлейс", rating: "1110", likes: "124", followers: "34")
        
        
        let some6 = FavoritesFetchData(profileWith: UIImage(named: "fav_\(3).png")!, andProfile: "Мари Кьюри", rating: "1109", likes: "129", followers: "24")
        
      
        let loadedList = [some0,some1,some2,some3,some4,some5,some6,]
        
        favorites = loadedList
        
    }
    
    func getFavorites() -> [FavoritesFetchData] {
        return favorites
    }
    
    func addFavorite(favorite: FavoritesFetchData) {
         favorites.append(favorite)
    }
    
    func deleteAlbumAtIndex(index: Int) {
       favorites.removeAtIndex(index)
    }
    
    // functions for loading from cash/net
    private func fetchingList() {
        
    }
    
    
    
}
