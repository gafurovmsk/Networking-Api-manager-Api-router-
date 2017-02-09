//
//  FavoriteFecthData.swift
//  Magic Mirror
//
//  Created by Nik on 31/01/17.
//  Copyright © 2017 Gafurov Z. All rights reserved.
//

import Foundation

class FavoritesFetchData: NSObject {
    
    //  var profileId: String?
    
    var profileImage: UIImage
    var profileName: String
    var rating: String
    var likes: String
    var followers: String

    
    init(profileWith image: UIImage,
                     andProfile name: String,
                     rating: String,
                     likes: String,
                     followers: String){
        
        profileImage = image
        profileName = name
        self.rating = rating
        self.likes = likes
        self.followers = followers
    }
    
    
    override var description: String {
        return "name:  + \(profileName)\n" +
            "and rating: + \(rating)\n" +
            "lieks and comments + \(likes,followers)\n"
        
    }
    
    
}

