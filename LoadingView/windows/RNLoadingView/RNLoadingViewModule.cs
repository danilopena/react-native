using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Loading.View.RNLoadingView
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNLoadingViewModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNLoadingViewModule"/>.
        /// </summary>
        internal RNLoadingViewModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNLoadingView";
            }
        }
    }
}
