//
//  Queryable
//  Mural Test
//
//  Created by Ryan Burns on 1/15/17.
//  Copyright © 2017 Ryan Burns. All rights reserved.
//

import Foundation
import Firebase

protocol FIRQueryable
{
    static var COLLECTION_NAME: String { get }
}

extension FIRQueryable where Self: FIRModel
{
    static func From(key: String, completion: @escaping (Self) -> Void)
    {
        let collectionRef = FIRDatabase.database().reference().child(COLLECTION_NAME)
        
        collectionRef.child(key).observeSingleEvent(of: .value) { (snapshot: FIRDataSnapshot) in
            
            completion(Self(snapshot: snapshot))
        }
    }
}
