//
//  MuralModel.swift
//  Mural Test
//
//  Created by Ryan Burns on 1/15/17.
//  Copyright © 2017 Ryan Burns. All rights reserved.
//

import Foundation
import Firebase

class MuralModel: FIRModel, Queryable
{
    static var COLLECTION_NAME = "murals"
    
    lazy var name: String? = self.get("name")
    lazy var desc: String? = self.get("description")
    lazy var images: [ImageModel] = self.get("images")
    lazy var artists: [ArtistModel] = self.get("artists")
}
