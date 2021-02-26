//
//  HobbiesData.swift
//  My CV
//
//  Created by Emilio Del Castillo on 26/02/2021.
//

import Foundation

class HobbiesData {
    static var shared = HobbiesData()
    
    let hobbies = [
        Card(title: "Basse", desc: "Depuis le 15 juin 2014, je joue de la basse dès que j'ai un peu de temps"),
        
        Card(title: "Batterie", desc: "Quand je ne suis pas en train de jouer de la basse, c'est la batterie qui prend le relai"),
        
        Card(title: "Bricolage", desc: "Depuis tout petit, je démonte et remonte tout ce que je peux. Désormais on me connait comme celui qui répare les choses !"),
        
        Card(title: "Dessin", desc: "De temps en temps je dessine un peu, surtout des machines ou une petite histoire avec un roi"),
        
        Card(title: "Science...?", desc: "Souvent je regarde des vidéos de vulgarisation de sujets scientifiques, médecine, physique, biologie..."),
        
        Card(title: "Swift", desc: "Depuis quelque temps, Swift c'est aussi un peu devenu un loisir 🙃")
    ]
}
