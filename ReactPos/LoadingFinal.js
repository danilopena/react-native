import PropTypes from 'prop-types';
import React from 'react';
import {requireNativeComponent} from 'react-native';

class LoadingFinal extends React.Component {
  render() {
    return <LoadingViewReally />;
  }
}

// LoadingFinal.propTypes = {
//   /**
//    * A Boolean value that determines whether the user may use pinch
//    * gestures to zoom in and out of the map.
//    */
//   zoomEnabled: PropTypes.bool,
// };

var LoadingEnd = requireNativeComponent('LoadingViewReally', null);

module.exports = LoadingEnd;

