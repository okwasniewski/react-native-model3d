package com.model3d

import android.view.View

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.viewmanagers.Model3dViewManagerDelegate
import com.facebook.react.viewmanagers.Model3dViewManagerInterface

abstract class Model3dViewManagerSpec<T : View> : SimpleViewManager<T>(), Model3dViewManagerInterface<T> {
  private val mDelegate: ViewManagerDelegate<T>

  init {
    mDelegate = Model3dViewManagerDelegate(this)
  }

  override fun getDelegate(): ViewManagerDelegate<T>? {
    return mDelegate
  }
}
