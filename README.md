# react-native-model3d

Render 3D models in visionOS apps

## Installation

```sh
yarn add react-native-model3d
```

## Usage

```js
import { Model3dView } from "react-native-model3d";

// ...

<Model3dView
  source="https://developer.apple.com/augmented-reality/quick-look/models/stratocaster/fender_stratocaster.usdz"
  aspectRatio="fit"
  style={styles.model3d}
/>
```

## Props

| Name   | Type   | Default | Description |
| ------ | ------ | ------- | ----------- |
| source | string |         | URL to the 3D model file |
| aspectRatio | enum('fit', 'fill') | 'fit' | Aspect ratio of the view |


## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
