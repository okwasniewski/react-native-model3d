import * as React from 'react';

import { Button, StyleSheet, Text, View } from 'react-native';
import { Model3dView } from 'react-native-model3d';
import Animated, {
  cancelAnimation,
  useAnimatedStyle,
  useSharedValue,
  withRepeat,
  withSpring,
} from 'react-native-reanimated';

import {
  Gesture,
  GestureDetector,
  GestureHandlerRootView,
} from 'react-native-gesture-handler';

const AnimatedModel3DView = Animated.createAnimatedComponent(Model3dView);

export default function App() {
  const scale = useSharedValue(1);
  const rotate = useSharedValue(0);
  const offsetX = useSharedValue(0);
  const offsetY = useSharedValue(0);

  const pan = Gesture.Pan()
    .onChange((event) => {
      offsetX.value = event.translationX;
      offsetY.value = event.translationY;
    })
    .onFinalize(() => {
      offsetX.value = withSpring(0);
      offsetY.value = withSpring(0);
    });

  const rotationStyle = useAnimatedStyle(() => {
    return {
      transform: [
        { rotateZ: `${rotate.value}deg` },
        { scale: scale.value },
        { translateX: offsetX.value },
        { translateY: offsetY.value },
      ],
    };
  });
  return (
    <GestureHandlerRootView style={styles.container}>
      <Text style={styles.title}>React Native Model3D</Text>
      <GestureDetector gesture={pan}>
        <AnimatedModel3DView
          source="pancakes.usdz"
          style={[rotationStyle, styles.box]}
        />
      </GestureDetector>
      <AnimatedModel3DView
        source="https://developer.apple.com/augmented-reality/quick-look/models/stratocaster/fender_stratocaster.usdz"
        aspectRatio="fit"
        style={[rotationStyle, styles.box]}
      />
      <View style={{ flexDirection: 'row' }}>
        <Button
          title="Animate"
          onPress={() => {
            rotate.value = withRepeat(
              withSpring(360, { duration: 3000 }),
              -1,
              true
            );
          }}
        />
        <Button
          title="Scale up"
          onPress={() => {
            scale.value = withSpring(1.5);
          }}
        />
        <Button
          title="Scale Down"
          onPress={() => {
            scale.value = withSpring(1);
          }}
        />
        <Button
          title="Cancel Animation"
          onPress={() => {
            cancelAnimation(rotate);
          }}
        />
      </View>
    </GestureHandlerRootView>
  );
}

const styles = StyleSheet.create({
  title: {
    fontSize: 30,
    color: 'white',
    fontWeight: 'bold',
  },
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    margin: 40,
  },
  box: {
    width: 300,
    height: 300,
  },
});
