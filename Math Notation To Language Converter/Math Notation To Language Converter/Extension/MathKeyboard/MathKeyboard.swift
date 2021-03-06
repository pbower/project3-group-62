//
//  MathKeyboard.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 06/06/2018
//  Copyright © 2018 Summer Studios. All rights reserved.
//
//  Note: This code was built by referencing this Tutorial  https://digitalleaves.com/blog/2016/12/custom-in-app-keyboards/
//
//  To the Marker:
//  Please be aware that due to a genuine IOS bug accessoryKeyboards do not display properly in XCode only unless one unchecks Hardware > Keyboard > 'Connect Hardware Keyboard' from the Simulator menu

import UIKit

let MathKeyboardRecommendedHeight = 240.0

//setup images for Custom Math Keyboard -> for before and on-click
private let mathKeyboardNormalImage = UIImage(named: "mathKeyBackground")!
private let mathKeyboardPressedImage = UIImage(named: "pressedMathKeyBackground")!

//custom math keyboard currently accepts Symbols, but other types can easily be added e.g. formula, numbers etc.
@objc protocol MathKeyboardDelegate { func mathSymbolPressed(symbol: String) }

//setup Button outlets for all mathKeyboard items
//also note the MathKeyboard.xib button outlets linked to 'File's Owner' symbolWasPressed events file
class MathKeyboard: UIView {

    @IBOutlet weak var identicallyEqualsBtn: UIButton!
    @IBOutlet weak var notEqualsBtn: UIButton!
    @IBOutlet weak var approxEqualsBtn: UIButton!
    @IBOutlet weak var tildeBtn: UIButton!
    @IBOutlet weak var muchLessThanBtn: UIButton!
    @IBOutlet weak var muchGreaterThanBtn: UIButton!
    @IBOutlet weak var lessThanBtn: UIButton!
    @IBOutlet weak var greaterThanBtn: UIButton!
    @IBOutlet weak var dotProductBtn: UIButton!
    @IBOutlet weak var infinityBtn: UIButton!
    @IBOutlet weak var arrowBtn: UIButton!
    @IBOutlet weak var rightDoubleArrowBtn: UIButton!
    @IBOutlet weak var leftDoubleArrowBtn: UIButton!
    @IBOutlet weak var upsideDownABtn: UIButton!
    @IBOutlet weak var existentialBtn: UIButton!
    @IBOutlet weak var epsilonBtn: UIButton!
    @IBOutlet weak var notAnElementOfBtn: UIButton!
    @IBOutlet weak var unionBtn: UIButton!
    @IBOutlet weak var intersectionBtn: UIButton!
    @IBOutlet weak var inclusionBtn: UIButton!
    @IBOutlet weak var nonStrictInclusionBtn: UIButton!
    @IBOutlet weak var emptySetBtn: UIButton!
    @IBOutlet weak var summationBtn: UIButton!
    @IBOutlet weak var productBtn: UIButton!
    @IBOutlet weak var partialDerivativeBtn: UIButton!
    @IBOutlet weak var nablaBtn: UIButton!
    @IBOutlet weak var integralBtn: UIButton!
    @IBOutlet weak var contourIntegralBtn: UIButton!
    @IBOutlet weak var perpindicularBtn: UIButton!
    @IBOutlet weak var parallelBtn: UIButton!
    @IBOutlet weak var squareRootBtn: UIButton!
    @IBOutlet weak var nthRootBtn: UIButton!
    @IBOutlet weak var modulusBtn: UIButton!
    @IBOutlet weak var realNumbersBtn: UIButton!
    @IBOutlet weak var thetaBtn: UIButton!
    @IBOutlet weak var gammaBtn: UIButton!
    @IBOutlet weak var incompleteGammaBtn: UIButton!
    @IBOutlet weak var degenerateBtn: UIButton!
    @IBOutlet weak var laplaceBtn: UIButton!
    @IBOutlet weak var piBtn: UIButton!
    
    
    var allButtons: [UIButton] { return [       //create single variable of all Math Keyboard Buttons
        identicallyEqualsBtn,
        notEqualsBtn,
        approxEqualsBtn,
        tildeBtn,
        muchLessThanBtn,
        muchGreaterThanBtn,
        lessThanBtn,
        greaterThanBtn,
        dotProductBtn,
        infinityBtn,
        arrowBtn,
        rightDoubleArrowBtn,
        leftDoubleArrowBtn,
        upsideDownABtn,
        existentialBtn,
        epsilonBtn,
        notAnElementOfBtn,
        unionBtn,
        intersectionBtn,
        inclusionBtn,
        nonStrictInclusionBtn,
        emptySetBtn,
        summationBtn,
        productBtn,
        partialDerivativeBtn,
        nablaBtn,
        integralBtn,
        contourIntegralBtn,
        perpindicularBtn,
        parallelBtn,
        squareRootBtn,
        nthRootBtn,
        modulusBtn,
        realNumbersBtn,
        thetaBtn,
        gammaBtn,
        incompleteGammaBtn,
        degenerateBtn,
        laplaceBtn,
        piBtn]
    }
    
    weak var delegate: MathKeyboardDelegate?        // Setup data
    
    var normalBackgroundImage = mathKeyboardNormalImage { didSet { updateButtonsAppearance() } }        // Setup appearance variables
    var pressedBackgroundImage = mathKeyboardPressedImage { didSet { updateButtonsAppearance() } }
    var normalFontColor = UIColor.white { didSet { updateButtonsAppearance() } }
    var pressedFontColor = UIColor.white { didSet { updateButtonsAppearance() } }
    
    override init(frame: CGRect) {      // Initialize the mathKeyboard
        super.init(frame: frame)
        initializeKeyboard()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeKeyboard()
    }
    
    func initializeKeyboard() {         //setup mathKeyboard view
        let xibFileName = "MathKeyboard"
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
        updateButtonsAppearance()
    }

    fileprivate func updateButtonsAppearance() {        // setup button Appearance
        for button in allButtons {
            button.setTitleColor(normalFontColor, for: .normal)
            button.setTitleColor(pressedFontColor, for: [.selected, .highlighted])
            button.setBackgroundImage(normalBackgroundImage, for: .normal)
            button.setBackgroundImage(pressedBackgroundImage, for: [.selected, .highlighted])
        }
    }

    @IBAction func symbolWasPressed(_ sender: UIButton) {                   // handle symbol button being pressed
        if let symbol = sender.titleLabel?.text, !symbol.isEmpty {          // further IBActions for new button types can be added below here
            self.delegate?.mathSymbolPressed(symbol: symbol)
        }
    }
    
}
