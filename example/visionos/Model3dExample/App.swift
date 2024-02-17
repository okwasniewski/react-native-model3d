import SwiftUI
import React
import React_RCTSwiftExtensions

@main
struct Model3dExampleApp: App {
  @UIApplicationDelegateAdaptor var delegate: AppDelegate
  
  var body: some Scene {
    RCTMainWindow(moduleName: "Model3dExample")
  }
}
