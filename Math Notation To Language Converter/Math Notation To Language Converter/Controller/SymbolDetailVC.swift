//
//  SymbolDetailVC.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/6/2.
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import UIKit

class SymbolDetailVC: UIViewController {

    var symbol : Symbol?
    //Ui Elements 
    @IBOutlet weak var symbolLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var meaningLabel: UITextView!
    
    @IBOutlet weak var translationLabel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let dic = Dictionary()
        self.symbol = dic.symbolArray[31]
         */
        //Fetch & display the data to the view
        if let symbol = self.symbol {
            symbolLabel.text = symbol.symbol
            nameLabel.text = symbol.name
            meaningLabel.text = symbol.meaning
            translationLabel.text = symbol.translation
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}