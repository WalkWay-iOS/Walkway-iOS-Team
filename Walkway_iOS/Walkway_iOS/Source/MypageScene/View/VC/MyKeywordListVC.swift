//
//  MyKeywordListVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/15.
//

import UIKit

var keywordName = ["#여행", "#여행", "#데이트코스", "#등산코스", "#스포츠코스", "#야구장", "#농구장", "#배구장"]
let keywordColor: [UIColor] = [UIColor.blue, UIColor.systemIndigo, UIColor.purple, UIColor.blue, UIColor.brown, UIColor.orange, UIColor.red, UIColor.systemIndigo]

class MyKeywordListVC: UIViewController {

    @IBOutlet var backButton: UIButton!
    @IBOutlet var viewTitleLabel: UILabel!
    @IBOutlet var myKeywordCollectionView: UICollectionView!
    
    var delegate: myPagePresentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - CollectionViewDelegate
extension MyKeywordListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keywordName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyKeywordCVC.identifier, for: indexPath) as? MyKeywordCVC else {
            return UICollectionViewCell()
        }
        cell.setData(keyword: keywordName[indexPath.row])
        return cell
    }
}

extension MyKeywordListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }
}
// MARK: - UI
extension MyKeywordListVC {
    func setUI() {
        setCollectionView()
        setCollectionViewNib()
        setLabel()
        setButton()
    }
    
    func setCollectionView() {
        myKeywordCollectionView.delegate = self
        myKeywordCollectionView.dataSource = self
    }
    
    func setCollectionViewNib() {
        let nibName = UINib(nibName: "MyKeywordCVC", bundle: nil)
        myKeywordCollectionView.register(nibName, forCellWithReuseIdentifier: MyKeywordCVC.identifier)
    }
    
    func setLabel() {
        viewTitleLabel.font = .boldSystemFont(ofSize: 20)
        viewTitleLabel.text = "나의 키워드"
    }
    
    func setButton() {
        backButton.setTitle("", for: .normal)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.addTarget(self, action: #selector(touchUpBack), for: .touchUpInside)
    }
}

// MARK: - Action
extension MyKeywordListVC {
    @objc func touchUpBack() {
        dismiss(animated: false, completion: nil)
    }
}
