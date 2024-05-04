import SwiftUI
import RealityKit
import Observation
import React

#if os(visionOS)

@objc public class Model3DView: UIView {
  private var props = Model3DViewProps(url: nil)
  
  private var modelView: UIViewController {
    UIHostingController(rootView: ModelView().environment(props))
  }
  
  @objc public var source: String = "" {
    didSet {
      props.url = source
    }
  }
  
  @objc public var aspectRatio: NSString? = nil {
    didSet {
      props.aspectRatio = aspectRatio
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.reactAddController(toClosestParent: modelView)
    if let view = modelView.view {
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

#endif


