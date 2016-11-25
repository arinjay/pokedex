//
//  PokeCellCollectionViewCell.swift
//  Pokedex
//
//  Created by Arinjay on 02/11/16.
//  Copyright © 2016 Arinjay. All rights reserved.
//

import UIKit

class PokeCellCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!  // 
    
    
    
    // making images rounded
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
       layer.cornerRadius = 5.0
    }
    //---
    
    func configureCell(pokemon: Pokemon)
    {
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
    
    
    
    
}
