//
//  ViewController.swift
//  Pokedex
//
//  Created by Arinjay on 29/10/16.
//  Copyright © 2016 Arinjay. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout,
UISearchBarDelegate{

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet var searchBar: UISearchBar!
    
    var pokemon = [Pokemon]()
    var musicPlayer: AVAudioPlayer!
    var inSearchMode = false
    var filterPokemon = [Pokemon]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self    // delegaton for this collection is for this class above
        collection.dataSource = self
        searchBar.delegate = self
        parsePokemonCSV()
    }
    
    
//    func initAudio(){
//    
//        let path = NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!
//        do{
//             musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path)!)
//            musicPlayer.prepareToPlay()
//            musicPlayer.numberOfLoops = -1
//            musicPlayer.play()
//        }
//        catch let err as NSError {
//            print(err.debugDescription)
//        }
//     
//    }
    func initAudio() {
        
        let path = NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    func parsePokemonCSV() {
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                let poke = Pokemon(name: name, pokedexId: pokeId)
                pokemon.append(poke)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    
//    func parsePokemonCSV() {
//        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
//        
//        do {
//            let csv = try CSV(contentsOfURL: path)
//            let rows = csv.rows
//            
//            for row in rows {
//                let pokeId = Int(row["id"]!)!
//                let name = row["identifier"]!
//                let poke = Pokemon(name: name, pokedexId: pokeId)
//                pokemon.append(poke)
//            }
//            
//        } catch let err as NSError {
//            print(err.debugDescription)
//        }
//    }

    
    
    
    
    
    
    // everytime it needs a cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let  cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCellCollectionViewCell", forIndexPath: indexPath) as? PokeCellCollectionViewCell{
            
            //var pokemon = Pokemon(name: "Test", pokedexId: indexPath.row)
            let poke = pokemon[indexPath.row]
            cell.configureCell(poke)
            return cell
        }
        else{
            return UICollectionViewCell()
        }
    }

    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 718
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize (width: 105,height: 105)
    }
    
    
    @IBAction func musicbuttonpress(sender: UIButton!) {
        
        if musicPlayer.playing{
            musicPlayer.stop()
            sender.alpha = 0.2
        }
        else {
            musicPlayer.play()
            sender.alpha = 1.0
        }
        
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
        }
        else{
            inSearchMode = true
        }
        
    }
    
    
}

