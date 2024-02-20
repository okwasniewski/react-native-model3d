import SwiftUI
import RealityKit
import Observation

@Observable
class Model3DViewProps {
  var url: URL?
  var aspectRatio: NSString?
  
  init(url: URL?) {
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
      Model3D(url: url) { model in
        model
          .resizable()
          .aspectRatio(contentMode: props.convertAspectRatio(aspectRatio: props.aspectRatio))
      } placeholder: {
        ProgressView()
      }
    }
  }
}
