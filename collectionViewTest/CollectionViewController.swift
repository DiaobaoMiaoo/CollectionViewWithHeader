//
//  CollectionViewController.swift
//  collectionViewTest
//
//  Created by Ke MA on 2016-03-11.
//  Copyright © 2016 Kemin. All rights reserved.
//

import UIKit

private let reuseMartketingIdentifier = "MarketingCell"
private let reuseTopPicksIdentifier = "TopPicksCell"
private let reuseCategoriesIdentifier = "CateogryCell"

private let reuseViewIdentifier = "categoriesHeader"

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var categories: UICollectionView!
    var headerView: categoriesHeader?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.categories!.isAccessibilityElement = false
        
        self.categories.dataSource = self
        self.categories.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "VoiceOverStatusChanged", name: UIAccessibilityVoiceOverStatusChanged, object: nil)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if collectionView.tag == 0 {
            return 1
        } else if collectionView.tag == 1 {
            return 1
        } else {
            return 1
        }
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if collectionView.tag == 0 {
            return 3
        } else if collectionView.tag == 1 {
            return 4
        } else {
            return 20
        }
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseMartketingIdentifier, forIndexPath: indexPath) as! marketingCell
            
            cell.backgroundColor = UIColor.redColor()
            cell.label.text = "\(indexPath.row)"
            return cell
            
        } else if collectionView.tag == 1 {
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseTopPicksIdentifier, forIndexPath: indexPath) as! topPicksCell
            
            cell.backgroundColor = UIColor.blueColor()
            cell.label.text = "\(indexPath.row)"
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseCategoriesIdentifier, forIndexPath: indexPath) as! categoriesCell
            
            cell.backgroundColor = UIColor.purpleColor()
            cell.label.text = "\(indexPath.row)"
            
            return cell
        }
    }
    
    func collectionView(collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
            //1
            switch kind {
                //2
            case UICollectionElementKindSectionHeader:
                //3
                headerView =
                collectionView.dequeueReusableSupplementaryViewOfKind(kind,
                    withReuseIdentifier: reuseViewIdentifier,
                    forIndexPath: indexPath)
                    as? categoriesHeader
                
                headerView?.topPicksLabel.text = "Top Picks"
                
                return headerView!
            default:
                //4
                assert(false, "Unexpected element kind")
            }
    }
    
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

            if collectionView.tag == 0 {
                return CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetHeight(collectionView.bounds))
            } else if collectionView.tag == 1 {
                return CGSizeMake(CGRectGetHeight(collectionView.bounds) * 9/10, CGRectGetHeight(collectionView.bounds) * 9/10)
            } else {
                return CGSizeMake(CGRectGetWidth(self.view.bounds)/2 - 20, CGRectGetWidth(self.view.bounds)/2 - 20)
            }
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            
            if collectionView.tag == 0 {
                return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            } else if collectionView.tag == 1 {
                return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            } else {
                return UIEdgeInsets(top: 0, left: 10, bottom: 0, right:10)
            }
    }

    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
            if collectionView.tag == 0 {
                return 0
            } else if collectionView.tag == 1 {
                return 10
            } else {
                return 10
            }
    }

    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
            if collectionView.tag == 0 {
                return 0
            } else if collectionView.tag == 1 {
                return 10
            } else {
                return 10
            }
    }
    // MARK: UICollectionViewDelegate
    
    func VoiceOverStatusChanged() {
        self.categories.reloadData()
    }
}
