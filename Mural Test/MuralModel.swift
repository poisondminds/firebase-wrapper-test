//
//  MuralModel.swift
//  Mural Test
//
//  Created by Ryan Burns on 1/15/17.
//  Copyright © 2017 Ryan Burns. All rights reserved.
//

import Foundation
import Firebase

class MuralModel: FIRModel, FIRQueryable, FIRPropertySettable, FIRPropertyGettable
{
    static var COLLECTION_NAME = "murals"
	
	static var FIELD_NAME = "name"
	static var FIELD_DESCRIPTION = "description"
	
	var name: String? {
		get { return self.get(MuralModel.FIELD_NAME) }
		set { self.set(value: newValue, for: MuralModel.FIELD_NAME) }
	}
	var desc: String? {
		get { return self.get(MuralModel.FIELD_DESCRIPTION) }
		set { self.set(value: newValue, for: MuralModel.FIELD_DESCRIPTION) }
	}
	
	var images: [ImageModel] { return self.get(ImageModel.COLLECTION_NAME) }
	var artists: [ArtistModel] { return self.get(ArtistModel.COLLECTION_NAME) }
	
//	class func Create(name: String, desc: String, artists: [ArtistModel], completion: @escaping (MuralModel) -> Void)
//	{
//		let json = [
//			FIELD_NAME: name,
//			FIELD_DESCRIPTION: desc,
//			ArtistModel.COLLECTION_NAME: [
//				
//			]
//		];
//		
//		let ref = FIRDatabase.database().reference().child(MuralModel.COLLECTION_NAME).childByAutoId()
//		ref.updateChildValues(json)
//		
//		ref.observe(.value) { (snapshot: FIRDataSnapshot) in
//			
//			completion(MuralModel(snapshot: snapshot))
//		}
//	}
}
