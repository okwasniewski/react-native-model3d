import * as React from 'react';

import { StyleSheet, Text, View } from 'react-native';
import { Model3dView } from 'react-native-model3d';

export default function App() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>React Native Model3D</Text>
      <View style={styles.innerContainer}>
        <Model3dView
          source="tv_retro"
          style={styles.box}
          onLoad={() => {
            console.log('Model loaded from local file');
          }}
        />
        <Model3dView
          source="https://developer.apple.com/augmented-reality/quick-look/models/stratocaster/fender_stratocaster.usdz"
          style={styles.box}
          onLoad={() => {
            console.log('Model loaded from URL');
          }}
        />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  title: {
    fontSize: 30,
    color: 'white',
    fontWeight: 'bold',
    marginBottom: 40,
  },
  container: {
    flex: 1,
    width: '100%',
    height: '100%',
    alignItems: 'center',
    marginTop: 90,
  },
  innerContainer: { flexDirection: 'row' },
  box: {
    width: 300,
    height: 300,
  },
});
