//
//  PageSliderOne.swift
//  HorizontalScrollView
//
//  Created by Gabriel Trujillo Gómez on 8/11/17.
//  Copyright © 2017 Gabriel Trujillo Gómez. All rights reserved.
//

import UIKit

class PageSliderOne: UIView
{
    @IBOutlet weak var pageButtonOne: UIButton!
    @IBOutlet weak var pageButtonTwo: UIButton!
    
    
    @IBAction func onButtonPressed(_ sender: Any)
    {
        print("Page SLider one tapped!!")
    }
}

