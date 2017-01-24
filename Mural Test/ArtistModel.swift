//
//  ArtistModel.swift
//  Mural Test
//
//  Created by Ryan Burns on 1/15/17.
//  Copyright © 2017 Ryan Burns. All rights reserved.
//

import Foundation
import Firebase

class ArtistModel: FIRModel, FIRQueryable, FIRPropertyGettable, FIRPropertySettable
{
    static var COLLECTION_NAME = "artists"
	
	static var FIELD_FIRSTNAME = "first_name"
	static var FIELD_LASTNAME = "last_name"
	static var FIELD_BIO = "bio"
	static var FIELD_COUNTRY = "country"

	var firstName: String? {
		get { return self.get(ArtistModel.FIELD_FIRSTNAME) }
		set { self.set(value: newValue, for: ArtistModel.FIELD_FIRSTNAME) }
	}
	var lastName: String? {
		get { return self.get(ArtistModel.FIELD_LASTNAME) }
		set { self.set(value: newValue, for: ArtistModel.FIELD_LASTNAME) }
	}
	var bio: String? {
		get { return self.get(ArtistModel.FIELD_BIO) }
		set { self.set(value: newValue, for: ArtistModel.FIELD_BIO) }
	}
	var country: String? {
		get { return self.get(ArtistModel.FIELD_COUNTRY) }
		set { self.set(value: newValue, for: ArtistModel.FIELD_COUNTRY) }
	}
	var murals: [MuralModel] {
		get { return self.get(MuralModel.COLLECTION_NAME) }
	}
}
