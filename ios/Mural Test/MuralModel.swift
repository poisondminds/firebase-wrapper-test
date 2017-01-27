

import Foundation
import Firebase

class MuralModel: FIRModel, FIRQueryable, FIRPropertyWritable
{
    static var COLLECTION_NAME = "murals"
	
	static var FIELD_NAME = "name"
	static var FIELD_DESCRIPTION = "description"
    static var FIELD_IMAGES = "images"
	
	var name: String? {
		get { return self.get(MuralModel.FIELD_NAME) }
		set { self.set(value: newValue, for: MuralModel.FIELD_NAME) }
	}
	var desc: String? {
		get { return self.get(MuralModel.FIELD_DESCRIPTION) }
		set { self.set(value: newValue, for: MuralModel.FIELD_DESCRIPTION) }
	}
	
	var images: [ImageModel] { return self.get(MuralModel.FIELD_IMAGES) }
	var artists: [ArtistModel] { return self.get(ArtistModel.COLLECTION_NAME) }
	
    func addArtist(artist: ArtistModel)
    {
        self.add(key: artist.key, forNode: ArtistModel.COLLECTION_NAME)
    }
}
