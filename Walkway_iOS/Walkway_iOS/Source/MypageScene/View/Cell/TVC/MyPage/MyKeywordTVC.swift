//
//  MyKeywordTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/10.
//

import UIKit

class MyKeywordTVC: UITableViewCell {
    static let identifier = "MyKeywordTVC"
    
    @IBOutlet var myKeywordTitleLabel: UILabel!
    @IBOutlet var keywordAllButton: UIButton!
    @IBOutlet weak var keywordCollectionView: UICollectionView!
    
    var delegate: myPagePresentDelegate?
    
    var keywords: [Hashtag] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func touchUpViewAllButton(_ sender: UIButton) {
        delegate?.cellTapedMyKeyword()
    }
}

// MARK: - CollectionViewDelegate
extension MyKeywordTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keywords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerKeywordCVC.identifier, for: indexPath) as? FollowerKeywordCVC else {
            return UICollectionViewCell()
        }
        cell.setLabelText(text: keywords[indexPath.row].keyword)
        return cell
    }
}

extension MyKeywordTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 78, height: 25.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 9, left: 16, bottom: 19, right: 16)
    }
}

// MARK: - UI
extension MyKeywordTVC {
    func setUI() {
        setCollectionView()
        setLabel()
        setButton()
    }
    
    private func setCollectionView() {
        keywordCollectionView.delegate = self
        keywordCollectionView.dataSource = self
        
        let nibName =  UINib(nibName: "FollowerKeywordCVC", bundle: nil)
        keywordCollectionView.register(nibName, forCellWithReuseIdentifier: FollowerKeywordCVC.identifier)
    }
    
    func setLabel() {
        myKeywordTitleLabel.text = "나의 키워드"
    }
    
    func setButton() {
        keywordAllButton.tintColor = .black
        keywordAllButton.setTitle("전체보기", for: .normal)
    }
    
    func setData(courses: [Course]) {
        for course in courses {
            var tags = course.hashtag
            for tag in tags {
                keywords.append(tag)
            }
        }
    }
}
