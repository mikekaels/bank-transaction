//
//  GradientView.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 10/03/22.
//

import UIKit

class GradientView: UIView {

    private let gradient : CAGradientLayer = CAGradientLayer()
    private let gradientStartColor: UIColor
    private let gradientEndColor: UIColor
    private let startPoint: CGPoint
    private let endPoint: CGPoint

    init(gradientStartColor: UIColor, gradientEndColor: UIColor, startPoint: CGPoint, endPoint: CGPoint) {
        self.gradientStartColor = gradientStartColor
        self.gradientEndColor = gradientEndColor
        self.startPoint = startPoint
        self.endPoint = endPoint
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradient.frame = self.bounds
    }

    override public func draw(_ rect: CGRect) {
        gradient.frame = self.bounds
        gradient.colors = [gradientStartColor.cgColor, gradientEndColor.cgColor]
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        if gradient.superlayer == nil {
            layer.insertSublayer(gradient, at: 0)
        }
    }
}
