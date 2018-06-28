//
//  ViewController.swift
//  ProjectSpoladori
//
//  Created by Macbook Pro 8 on 22/06/18.
//  Copyright © 2018 Roberto Lombi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    ////////////////////////
    // MARK: ELEMENTI     //
    ////////////////////////
    
    @IBOutlet weak var CaroselloImage: UIImageView!
    
    @IBOutlet weak var RightArrow: UIButton!
    @IBOutlet weak var LeftArrow: UIButton!
    @IBOutlet weak var ProductTitle: UILabel!
    @IBOutlet weak var ProductDescription: UILabel!
    
   
    
    //variabile per tenere traccia dell'item da visualizzare
    var indiceImg: Int = 0
    var Titolo: String? = ""
    var Descr: String? = ""
    
    //Array of Images
    var SequenzaImmagini =  [
        UIImage(named: "landscape1"),
        UIImage(named: "landscape2"),
        UIImage(named: "landscape3"),
        UIImage(named: "landscape4"),
        UIImage(named: "landscape5")
     ]
    
    //Array titoli dello stesso numero delle immagini
    var TitoliProdotti = ["La Lavatrice","Il Computer","L'Astronave","La Bottiglia","Il Coltello"]
    
     //Array descrizioni dello stesso numero delle immagini
    var DescrizionePro = ["E' molto utile ai giorni nostri",
                          "permette di unire le persone da ogni partedel mondo",
                          "è quella cosa che vorresti vedere ma non toccherai mai",
                          "E' l'amica che ti accompagna per la serata",
                          "E' utile per preparare deliziosi piatti però anche a cambiare la vita di una persona se usata male"
                        ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }//ViewDidLoad
    

    
    override func viewWillAppear(_ animated: Bool) {
        
        self.indiceImg = 0
        self.Titolo = ""
        self.Descr = ""
        settaImg()
        RArrowanimate()
        LArrowanimate()
        
        
    }//viewWillAppear
    
    @IBOutlet weak var rightArrowDistance: NSLayoutConstraint!
    
    ////////////////////////
    // MARK:  FUNZIONI    //
    ////////////////////////

    @IBAction func next(_ sender: Any) {
        
        //indice deve aumentare
        //pero entro i limiti!
        if indiceImg < SequenzaImmagini.count - 1{
            self.indiceImg = self.indiceImg + 1
            self.ProductTitle.text? = TitoliProdotti[indiceImg]
            self.ProductDescription.text? = DescrizionePro[indiceImg]
            
        }
        settaImg()
            }
    
    @IBAction func previous(_ sender: Any) {
        
        //indice deve diminuire
        //pero entro i limiti!
        if indiceImg > 0{
            self.indiceImg = self.indiceImg - 1
            self.ProductTitle.text? = TitoliProdotti[indiceImg]
            self.ProductDescription.text? = DescrizionePro[indiceImg]
        }
        
        settaImg()
        }
    
    //per settare l'immagine,titolo e descrizione in accordo con la var
    func settaImg(){
        CaroselloImage.image = SequenzaImmagini[indiceImg]
        self.ProductTitle.text? = TitoliProdotti[indiceImg]
        self.ProductDescription.text? = DescrizionePro[indiceImg]
    }
    
    func RArrowanimate() {
        let animation = CABasicAnimation(keyPath: "position")
        
        //animation.isRemovedOnCompletion = false
        //animation.fillMode = kCAFillModeForwards
        
        animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.42,0.00, 0.58,1.00)
        animation.duration = 4.00
        animation.repeatCount = 1000
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: RightArrow.center.x, y: RightArrow.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: RightArrow.center.x + 8, y: RightArrow.center.y))
        RightArrow.layer.add(animation, forKey: "position")
        
    }
    func LArrowanimate() {
    let animation = CABasicAnimation(keyPath: "position")
    
    //animation.isRemovedOnCompletion = false
    //animation.fillMode = kCAFillModeForwards
    
    animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.0,0.0, 0.0,0.0)
    animation.duration = 4.00
    animation.repeatCount = 100
    animation.autoreverses = true
    animation.fromValue = NSValue(cgPoint: CGPoint(x: LeftArrow.center.x, y: LeftArrow.center.y))
    animation.toValue = NSValue(cgPoint: CGPoint(x: LeftArrow.center.x - 8, y: LeftArrow.center.y))
    LeftArrow.layer.add(animation, forKey: "position")
    
    }
    
    
   
}//ViewController







