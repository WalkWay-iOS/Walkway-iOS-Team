//
//  MyBadgeTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/10.
//

import UIKit

class MyBadgeTVC: UITableViewCell {
    static let identifier = "MyBadgeTVC"
    
    @IBOutlet var myBadgeTitleLabel: UILabel!
    @IBOutlet var badgeAllButton: UIButton!
    @IBOutlet weak var badgeCollectionView: UICollectionView!
    
    var delegate: myPagePresentDelegate?
    
    var images: [String] = ["bookmark", "paperplane", "person.3", "graduationcap", "sun.haze", "sparkles", "flame"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func touchUpViewAll(_ sender: UIButton) {
        delegate?.cellTapedMyBadge()
    }
}

extension MyBadgeTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerBadgeCVC.identifier, for: indexPath) as? FollowerBadgeCVC else {
            return UICollectionViewCell()
        }
        cell.setImage(image: images[indexPath.row])
        return cell
    }
}

extension MyBadgeTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 44, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 14, left: 16, bottom: 14, right: 16)
    }
}

// MARK: - UI
extension MyBadgeTVC {
    func setUI() {
        setLabel()
        setButton()
        setCollectionView()
    }
    
    private func setCollectionView() {
        badgeCollectionView.delegate = self
        badgeCollectionView.dataSource = self
        
        let nibName =  UINib(nibName: "FollowerBadgeCVC", bundle: nil)
        badgeCollectionView.register(nibName, forCellWithReuseIdentifier: FollowerBadgeCVC.identifier)
    }
    
    func setLabel() {
        myBadgeTitleLabel.text = "뱃지"
    }
    
    func setButton() {
        badgeAllButton.setTitle("전체보기", for: .normal)
        badgeAllButton.tintColor = .black
    }
}
