package com.model3d

import android.graphics.Color
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp

@ReactModule(name = Model3dViewManager.NAME)
class Model3dViewManager :
  Model3dViewManagerSpec<Model3dView>() {
  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): Model3dView {
    return Model3dView(context)
  }

  @ReactProp(name = "color")
  override fun setColor(view: Model3dView?, color: String?) {
    view?.setBackgroundColor(Color.parseColor(color))
  }

  companion object {
    const val NAME = "Model3dView"
  }
}
