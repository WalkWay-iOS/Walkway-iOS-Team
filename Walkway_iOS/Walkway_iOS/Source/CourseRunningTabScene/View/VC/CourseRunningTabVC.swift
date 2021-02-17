//
//  CourseRunningTabVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/01/29.
//

import UIKit

class CourseRunningTabVC: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}

//MARK: - courseRunningTab extension
extension CourseRunningTabVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseWalkingSetting", for: indexPath)
            cell.backgroundColor = .white
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseWalkingMap", for: indexPath)
            cell.backgroundColor = .black
            return cell
        } else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseWalkingInfo", for: indexPath)
            cell.backgroundColor = .white
            return cell
        }
        return UICollectionViewCell()
    }
    
    // 셀크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    }
    
    // 셀 위아래 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //셀 옆 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
