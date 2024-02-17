import * as React from 'react';

import { StyleSheet, View } from 'react-native';
import { Model3dView } from 'react-native-model3d';

export default function App() {
  return (
    <View style={styles.container}>
      <Model3dView color="#faa" style={styles.box} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
