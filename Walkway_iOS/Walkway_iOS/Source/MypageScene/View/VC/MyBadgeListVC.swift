//
//  MyBadgeListVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/15.
//

import UIKit

var badgeName = ["사진왕", "기록왕", "북마크왕", "코스왕"]
var badgeImage = ["camera", "highlighter", "bookmark", "flag"]

class MyBadgeListVC: UIViewController {

    @IBOutlet var viewTitleLabel: UILabel!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var myBadgeCollectionView: UICollectionView!
    
    var delegate: myPagePresentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStatusBar(.lightGray)
        setUI()
    }
}

// MARK: - CollectionViewDelegate
extension MyBadgeListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return badgeName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyBadgeCVC.identifier, for: indexPath) as? MyBadgeCVC else {
            return UICollectionViewCell()
        }
        cell.setData(badge: badgeName[indexPath.row], image:  badgeImage[indexPath.row])
        return cell
    }
}

extension MyBadgeListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width - 50 - 20)/3
        return CGSize(width: width, height: 187)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }
}

// MARK: - UI
extension MyBadgeListVC {
    func setUI() {
        setCollectionView()
        setCollectionViewNib()
        setLabel()
        setButton()
    }
    
    func setCollectionView() {
        myBadgeCollectionView.delegate = self
        myBadgeCollectionView.dataSource = self
    }
    
    func setCollectionViewNib() {
        let nibName = UINib(nibName: "MyBadgeCVC", bundle: nil)
        myBadgeCollectionView.register(nibName, forCellWithReuseIdentifier: MyBadgeCVC.identifier)
    }
    
    func setLabel() {
        viewTitleLabel.font = .boldSystemFont(ofSize: 20)
        viewTitleLabel.text = "나의 뱃지"
    }
    
    func setButton() {
        backButton.setTitle("", for: .normal)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.addTarget(self, action: #selector(touchUpBack), for: .touchUpInside)
    }
}

// MARK: - Action
extension MyBadgeListVC {
    @objc func touchUpBack() {
        dismiss(animated: false, completion: nil)
    }
}
