//
//  ArtistModel.swift
//  Mural Test
//
//  Created by Ryan Burns on 1/15/17.
//  Copyright © 2017 Ryan Burns. All rights reserved.
//

import Foundation
import Firebase

class ImageModel: FIRModel
{
	static var FIELD_LOCATION = "location"
	var location: String? { return self.get(ImageModel.FIELD_LOCATION) }
}
