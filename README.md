# react-native-model3d

Render 3D models in visionOS apps

![Screenshot](https://github.com/okwasniewski/react-native-model3d/assets/52801365/bf5d7800-2884-4b78-8f76-7b96b8fab080)

## Installation

```sh
yarn add react-native-model3d
```

## Supported platforms
- visionOS
- iOS (Coming soon)

## Usage

```js
import { Model3dView } from "react-native-model3d";

// ...

<Model3dView
  source="https://developer.apple.com/augmented-reality/quick-look/models/stratocaster/fender_stratocaster.usdz"
  modelAspectRatio="fit"
  onLoad={() => console.log('Model loaded')}
  style={styles.model3d}
/>
```

## Props

| Name   | Type   | Default | Description |
| ------ | ------ | ------- | ----------- |
| source | string |         | URL to the 3D model file |
| modelAspectRatio | enum('fit', 'fill') | 'fit' | Aspect ratio of the view |
| onLoad | function | | Callback called when the model is loaded |


## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
