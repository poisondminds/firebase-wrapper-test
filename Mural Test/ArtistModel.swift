//
//  ArtistModel.swift
//  Mural Test
//
//  Created by Ryan Burns on 1/15/17.
//  Copyright © 2017 Ryan Burns. All rights reserved.
//

import Foundation
import Firebase

class ArtistModel: FIRModel, Queryable
{
    static var COLLECTION_NAME = "artists"
    
    lazy var firstName: String? = self.get("first_name")
    lazy var lastName: String? = self.get("last_name")
    lazy var bio: String? = self.get("bio")
    lazy var country: String? = self.get("country")
    lazy var murals: [MuralModel] = self.get("murals")
}
