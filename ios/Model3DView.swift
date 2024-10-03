import SwiftUI
import RealityKit
import Observation
import React

@objc public protocol Model3dViewDelegate {
  func onLoad() 
}

// RCTDirectEventBlock is not defined for new architecture. Unfortunately RCT_NEW_ARCH_ENABLED flag is not passed to Swift.
public typealias RCTDirectEventBlock = ([AnyHashable : Any]?) -> Void

@objc public class Model3DView: UIView {
  private var delegate: Model3dViewDelegate?
  private var props = Model3DViewProps(url: nil)

  private var modelView: UIViewController?

  @objc public var source: String = "" {
    didSet {
      props.url = source
    }
  }

  @objc public var modelAspectRatio: NSString? = nil {
    didSet {
      props.modelAspectRatio = modelAspectRatio
    }
  }
  
  @objc public var onLoad: RCTDirectEventBlock? = nil {
    didSet {
      props.onLoad = onLoad
    }
  }
 
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  @objc public convenience init(withDelegate delegate: Model3dViewDelegate?) {
    self.init(frame: .zero)
    self.delegate = delegate
    modelView = UIHostingController(
      rootView: ModelView(delegate: delegate).environmentObject(props)
    )
    self.reactAddController(toClosestParent: modelView)
    if let modelView, let view = modelView.view {
      view.translatesAutoresizingMaskIntoConstraints = false
      self.addSubview(view)
      NSLayoutConstraint.activate([
        view.leftAnchor.constraint(equalTo: self.leftAnchor),
        view.topAnchor.constraint(equalTo: self.topAnchor),
        view.rightAnchor.constraint(equalTo: self.rightAnchor),
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
      ])
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
