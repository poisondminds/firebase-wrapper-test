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
                
        FIRDatabase.database().reference().child("murals").queryLimited(toFirst: 1).observe(.childAdded) { (muralSnapshot: FIRDataSnapshot) in
            
            self.mural = MuralModel(snapshot: muralSnapshot)
            
            
            self.titleLabel.text = self.mural.name!
            self.descriptionTextView.text = self.mural.desc!
            
            let firstArtist = self.mural.artists[0]
            print(firstArtist)
            
            ArtistModel.From(key: firstArtist.key, completion: { (artistFull) in
                
                self.artistLabel.text = artistFull.firstName!
            })
            
            let firstImage = self.mural.images[0]
            
            if let url = firstImage.url, let u = URL(string: url), let imageData = try? Data(contentsOf: u)
            {
                self.imageView.image = UIImage(data: imageData)
            }
            else
            {
                print(":(")
            }
        }
    }
    
    @IBAction func getArtistsTapped(_ sender: Any) {
        
        ArtistModel.Create(firstName: "ARTTEST", lastName: "artist", bio: "This is the newest artist", country: "US") { (artist: ArtistModel) in
            
            print("Created artist: \(artist)")
            
            self.mural.addArtist(artist: artist)
        }
    }
}

