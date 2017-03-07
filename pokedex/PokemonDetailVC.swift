//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Nikolai Brix Laursen on 05/03/2017.
//  Copyright © 2017 Nikolai. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLBL: UILabel!
    @IBOutlet weak var defebseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexId: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currenteEvoImg: UIImageView!
    @IBOutlet weak var nexEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name.capitalized
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        nainImg.image = img
        currenteEvoImg.image = img
        pokedexId.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetail {
            
            self.updateUI()
        }
    }

    func updateUI() {
        attackLbl.text = pokemon.attack
        defebseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLBL.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "NO evelotions"
            nexEvoImg.isHidden = true
        } else {
            nexEvoImg.isHidden = false
            nexEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
        
    }
    
    @IBAction func backbuttonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        }

}
