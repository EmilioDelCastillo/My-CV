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
        Card(title: "Jouer de la basse", desc: "Depuis le 15 juin 2014, je joue de la basse dès que j'ai un peu de temps"),
        
        Card(title: "Jouer de la batterie", desc: "Quand je ne suis pas en train de jouer de la basse, c'est la batterie qui prend le relai"),
        
        Card(title: "Bricoler", desc: "Depuis tout petit, je démonte et remonte tout ce que je peux. Désormais on me connait comme celui qui répare les choses !"),
        
        Card(title: "Dessiner", desc: "De temps en temps je dessine un peu, surtout des machines ou une petite histoire avec un roi"),
        
        Card(title: "Écrire", desc: "Un de mes passe temps préférés est l'écriture. Parfois je m'installe sur mon lit avec mon ordinateur et je passe des heures à imaginer des histoires de simulateurs et de mondes virtuels, dans lesquels les \"utilisateurs\" peuvent agir sur le monde autour d'eux à l'aide de commandes de terminal. Un peu comme nous finalement."),
        
        Card(title: "Science...?", desc: "Souvent je regarde des vidéos de vulgarisation de sujets scientifiques, médecine, physique, biologie..."),
        
        Card(title: "Swift", desc: "Depuis quelque temps, Swift c'est aussi un peu devenu un loisir 🙃")
    ].shuffled()
}
