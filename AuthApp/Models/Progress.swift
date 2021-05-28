//
//  Progress.swift
//  AuthApp
//
//  Created by SERGEY VOROBEV on 28.05.2021.
//

import Foundation
import UIKit

struct Progress {
    var textColor: UIColor
    var text: String
    var period: String
    
    static func getProgressSteps() -> [Progress] {
        let steps = [
            Progress(textColor: UIColor(red: 255/255, green: 126/255, blue: 121/255, alpha: 1), text: "Окончание школы", period: "🤓 2005"),
            Progress(textColor: UIColor(red: 122/255, green: 129/255, blue: 255/255, alpha: 1), text: "Институт", period: "👨‍🎓 2010"),
            Progress(textColor: UIColor(red: 148/255, green: 33/255, blue: 147/255, alpha: 1), text: "Работа в школе", period: "🏫 2010 - 2017"),
            Progress(textColor: UIColor(red: 0, green: 150/255, blue: 255/255, alpha: 1), text: "Фриланс веб-разработчиком", period: "💻 2006 - настоящее время"),
            Progress(textColor: UIColor(red: 148/255, green: 82/255, blue: 0, alpha: 1), text: "Работа веб-разработчиком в компании", period: "💼 2017 - настоящее время"),
            Progress(textColor: UIColor(red: 0, green: 143/255, blue: 0, alpha: 1), text: "Мобильный разработчик", period: "👨‍💻 2021")
        ]
        
        return steps
    }
}

