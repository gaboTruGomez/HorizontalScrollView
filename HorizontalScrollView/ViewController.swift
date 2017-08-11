//
//  ViewController.swift
//  HorizontalScrollView
//
//  Created by Gabriel Trujillo Gómez on 8/11/17.
//  Copyright © 2017 Gabriel Trujillo Gómez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate
{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        scrollView.delegate = self
        let slides = createSlides(numberOfSlides: 5)
        
        setUpScrollView(slidesTitle: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
    }
    
    func createSlides(numberOfSlides: Int) -> [String]
    {
        var slides = [String]()
        for i in 0..<numberOfSlides
        {
            if i % 2 == 0
            {
                slides.append("slideOne")
            }
            else
            {
                slides.append("slideTwo")
            }
        }
        
        return slides
    }
    
    func setUpScrollView(slidesTitle: [String])
    {
        let slidesCount = slidesTitle.count
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slidesCount), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0..<slidesTitle.count
        {
            if slidesTitle[i] == "slideOne"
            {
                let slideOne = Bundle.main.loadNibNamed("PageSliderOne", owner: self, options: nil)?.first as! PageSliderOne
                slideOne.pageButtonOne.setTitle("Page \(i + 1) Button", for: .normal)
                slideOne.frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
                scrollView.addSubview(slideOne)
            }
            else
            {
                let slideTwo = Bundle.main.loadNibNamed("PageSliderTwo", owner: self, options: nil)?.first as! PageSliderTwo
                slideTwo.pageButton.setTitle("Page \(i + 1) Button", for: .normal)
                slideTwo.frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
                scrollView.addSubview(slideTwo)
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(currentPageIndex)
    }
}

