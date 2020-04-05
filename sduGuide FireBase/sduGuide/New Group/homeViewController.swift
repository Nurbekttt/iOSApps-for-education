//
//  homeViewController.swift
//  sduGuide
//
//  Created by Nurbek on 10/19/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit
import SwiftSoup

class homeViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet var scrollView: UIScrollView!
    
    var slides:[Slide] = [];

    let transiton = SlideInTransition()
    var z=1
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            if let url = URL(string: "https://sdu.edu.kz/") {
                do {
                    let html = try String(contentsOf: url)
                    let doc:Document = try SwiftSoup.parse(html)
                    let a:Elements = try doc.select("div.jet-smart-tiles__box-title")
                    
                    for i in a{
                        print(i,z)
                        z += 1
                    }
                    
                    
                    
                } catch {
                    // contents could not be loaded
                }
            } else {
                // the URL was bad!
            }
            
            
        }
//        z=3
//        pageControl.numberOfPages=z
//        var Rect = CGRect(x: 0, y: 0, width: 30, height: 30)
//        for i in 0..<z{
//            let slide = Slide()
//            slide.image = UIImageView(frame: Rect)
//            slide.title.text = "aaa\(z)"
//            slide.descriptionLabel.text = "bbb\(i)"
//            pageControl.addSubview(slide)
//
  //      }
        //view.bringSubviewToFront(pageControl)
        // Do any additional setup after loading the view.
    }
  
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "menuTableViewController") else {return}
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        //slide1.image.image = UIImage(named: "ic_onboarding_1")
        
        slide1.title.text = "A real-life bear"
        slide1.descriptionLabel.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        //slide2.image.image = UIImage(named: "ic_onboarding_2")
        slide2.title.text = "A real-life bear"
        slide2.descriptionLabel.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        
        return [slide1, slide2]
    }
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        
        /*
         * below code changes the background color of view on paging the scrollview
         */
        //        self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
        
        
        /*
         * below code scales the imageview on paging the scrollview
         */
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            
            slides[0].image.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            slides[1].image.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
            
        }

    }
    

}
extension homeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}
