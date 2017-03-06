//
//  ViewController.swift
//  Mural Test
//
//  Created by Ryan Burns on 1/15/17.
//  Copyright © 2017 Ryan Burns. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
	var mural: MuralModel!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        MuralModel.TopWhere(child: MuralModel.FIELD_NAME, equals: "The first mural") { (mural: MuralModel) in
            self.mural = mural
            
            self.showMural()
        }
    }
    
    fileprivate func showMural()
    {
        self.titleLabel.text = self.mural.name!
        self.descriptionTextView.text = self.mural.desc!
        
        let firstArtist = self.mural.artists[0]
        firstArtist.getExternal {
            self.artistLabel.text = firstArtist.firstName!
        }

        
        let firstImage = self.mural.images[0]
        
        let ref = FIRStorage.storage().reference(withPath: firstImage.location!)
        ref.data(withMaxSize: 1 * 1024 * 1024, completion: { (d: Data?, e: Error?) in
            
            if let error = e
            {
                print("Uh uh \(error)")
            }
            else
            {
                self.imageView.image = UIImage(data: d!)
            }
            
        })
    }
    
    @IBAction func getArtistsTapped(_ sender: Any) {
        
        ArtistModel.Create(firstName: "ARTTEST", lastName: "artist", bio: "This is the newest artist", country: "US") { (artist: ArtistModel) in
            
            print("Created artist: \(artist)")
            
            self.mural.addArtist(artist: artist)
        }
    }
}

