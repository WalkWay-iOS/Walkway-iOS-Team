//
//  MyCourseTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/10.
//

import UIKit

class MyCourseTVC: UITableViewCell {
    static let identifier = "MyCourseTVC"
    
    @IBOutlet var myCourseTitleLabel: UILabel!
    @IBOutlet var courseAllButton: UIButton!
    @IBOutlet var myCourseCollectionView: UICollectionView!
    
    var delegate: myPagePresentDelegate?
    
    var courses: [String] = ["남산 한바퀴", "남산 두바퀴", "룰루리랄라리 신나는북악산여행", "북악산가자", "집뒤에 숨어있는 보물"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func touchUpViewAll(_ sender: Any) {
        delegate?.cellTapedMyCourse()
    }
}

// MARK: - CollectionViewDelegate
extension MyCourseTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCourseCVC.identifier, for: indexPath) as? FollowerCourseCVC else {
            return UICollectionViewCell()
        }
        cell.setTitle(title: courses[indexPath.row])
        return cell
    }
}

extension MyCourseTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: 83)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 11, left: 16, bottom: 23, right: 16)
    }
}

/*
extension MyCourseTVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let dvc = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(identifier: "CourseDetailVC") as? CourseDetailVC else {
            return
        }
        delegate?.collectionViewCellTapedCourse(dvc: dvc)
    }
}
*/

// MARK: - UI
extension MyCourseTVC {
    private func setUI() {
        setCollectionView()
        setCollectionViewNib()
        setLabel()
        setButton()
    }
    
    private func setCollectionView() {
        myCourseCollectionView.delegate = self
        myCourseCollectionView.dataSource = self
    }
    
    private func setCollectionViewNib() {
        let nibName =  UINib(nibName: "FollowerCourseCVC", bundle: nil)
        myCourseCollectionView.register(nibName, forCellWithReuseIdentifier: FollowerCourseCVC.identifier)
    }
    
    private func setLabel() {
        myCourseTitleLabel.text = "나의 코스"
    }
    
    private func setButton() {
        courseAllButton.setTitleColor(.black, for: .normal)
        courseAllButton.setTitle("전체보기", for: .normal)
    }
}
