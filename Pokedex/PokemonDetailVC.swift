//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Arinjay on 25/11/16.
//  Copyright © 2016 Arinjay. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet var nameLbl: UILabel!
    var pokemon: Pokemon!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
