//
//  DragView.swift
//  W2Movie
//
//  Created by 麻哲源 on 2017/3/20.
//  Copyright © 2017年 Andy. All rights reserved.
//

import UIKit

private let kScreenHeight: CGFloat = 120.0

class DragView: UIView, UIScrollViewDelegate {
    private unowned var scrollView: UIScrollView
    private var progress: CGFloat = 0.0
    init(frame: CGRect, scrollView: UIScrollView) {
        self.scrollView = scrollView
        super.init(frame: frame)
        //backgroundColor = UIColor.green
        updateBackgroundColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateBackgroundColor() {
        backgroundColor = UIColor(white: 0.5 * progress + 0.2, alpha: 1.0)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //1-先拿到刷新视图可见区域的高度
        let refreshViewVisibleHeight = max(0, -scrollView.contentOffset.y - scrollView.contentInset.top)
        //2-计算当前滚动进度
        progress = min(1, refreshViewVisibleHeight / kScreenHeight)
        //3-根据进度改变背景颜色
        updateBackgroundColor()
        //4-根据进度更新视图位置
    }
}
