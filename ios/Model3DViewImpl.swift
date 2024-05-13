import SwiftUI
import RealityKit
import Observation
import React

class Model3DViewProps: ObservableObject {
  @Published var url: String?
  @Published var aspectRatio: NSString?
  @Published var onLoad: RCTDirectEventBlock?

  init(url: String?) {
    self.url = url
  }

  func convertAspectRatio(aspectRatio: NSString?) -> ContentMode {
    if aspectRatio == "fill" {
      return .fill
    } else {
      return .fit
    }
  }
}

struct ModelView: View {
  var delegate: Model3dViewDelegate?
  @EnvironmentObject private var props: Model3DViewProps

  var body: some View {
    if let url = props.url {
        Model3D(maybeURL: url) { model in
          model
            .resizable()
            .aspectRatio(contentMode: props.convertAspectRatio(aspectRatio: props.aspectRatio))
            .onAppear {
              // TODO: Find a way to call this only once
              delegate?.onLoad()
              props.onLoad?([:])
            }
        } placeholder: {
          ProgressView()
        }
    }
  }
}

#if os(visionOS)
extension Model3D {
  public init<Model, Placeholder>(maybeURL: String, @ViewBuilder content: @escaping (ResolvedModel3D) -> Model, @ViewBuilder placeholder: @escaping () -> Placeholder) where Content == Model3DPlaceholderContent<Model, Placeholder>, Model : View, Placeholder : View {
    if let url = URL(string: maybeURL), maybeURL.contains("http") {
      self.init(url: url, content: content, placeholder: placeholder)
    } else {
      self.init(named: maybeURL, content: content, placeholder: placeholder)
    }
  }
}
#endif


