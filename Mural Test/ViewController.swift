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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        FIRDatabase.database().reference().child("murals").queryLimited(toFirst: 1).observe(.childAdded) { (muralSnapshot: FIRDataSnapshot) in
            
            let mural = MuralModel(snapshot: muralSnapshot)
            
            
            self.titleLabel.text = mural.name!
            self.descriptionTextView.text = mural.desc!
            
            let firstArtist = mural.artists[0]
            print(firstArtist)
            
            ArtistModel.From(key: firstArtist.key, completion: { (artistFull) in
                
                self.artistLabel.text = artistFull.lastName!
            })
            
            let firstImage = mural.images[0]
            
            if let url = firstImage.url, let u = URL(string: url), let imageData = try? Data(contentsOf: u)
            {
                self.imageView.image = UIImage(data: imageData)
            }
            else
            {
                ImageModel.From(key: firstImage.key, completion: { (imageFull) in
                    self.imageView.image = UIImage(data: try! Data(contentsOf: URL(string: imageFull.url!)!))
                })
            }
        }
    }
    
    @IBAction func getArtistsTapped(_ sender: Any) {
        
        
        
    }
}

