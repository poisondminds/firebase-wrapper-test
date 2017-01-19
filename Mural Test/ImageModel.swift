//
//  ArtistModel.swift
//  Mural Test
//
//  Created by Ryan Burns on 1/15/17.
//  Copyright © 2017 Ryan Burns. All rights reserved.
//

import Foundation
import Firebase

class ImageModel: FIRModel, Queryable
{
    static var COLLECTION_NAME = "images"
    
    lazy var url: String? = self.get("url")
}
