import SwiftUI
import RealityKit
import Observation

#if os(visionOS)

@Observable
class Model3DViewProps {
  var url: String?
  var aspectRatio: NSString?
  
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
  @Environment(Model3DViewProps.self) private var props
  
  var body: some View {
    if let url = props.url {
        Model3D(maybeURL: url) { model in
          model
            .resizable()
            .aspectRatio(contentMode: props.convertAspectRatio(aspectRatio: props.aspectRatio))
        } placeholder: {
          ProgressView()
        }
    }
  }
}

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
