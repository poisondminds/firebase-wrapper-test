import Foundation
import Firebase

class ArtistModel: FIRModel, FIRQueryable, FIRPropertyWritable, FIRInsertable
{
    static var COLLECTION_NAME = "artists"
	
	static var FIELD_FIRSTNAME = "firstName"
	static var FIELD_LASTNAME = "lastName"
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
    
    class func Create(firstName: String, lastName: String, bio: String, country: String, completion: @escaping (ArtistModel) -> Void)
    {
        let data = [
            FIELD_FIRSTNAME: firstName,
            FIELD_LASTNAME: lastName,
            FIELD_BIO: bio,
            FIELD_COUNTRY: country
        ]
        
        self.Insert(data: data, completion: completion)
    }
}
