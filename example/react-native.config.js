const path = require('path');

const project = (() => {
  try {
    const { configureProjects } = require('react-native-test-app');
    return configureProjects({
      android: {
        sourceDir: 'android',
      },
      ios: {
        sourceDir: 'ios',
      },
      windows: {
        sourceDir: 'windows',
        solutionFile: 'windows/Example.sln',
      },
    });
  } catch (_) {
    return undefined;
  }
})();

module.exports = {
  dependencies: {
    'react-native-model3d': {
      root: path.join(__dirname, '..'),
    },
  },
  ...(project ? { project } : undefined),
};
