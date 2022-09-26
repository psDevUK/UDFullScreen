import React, { useCallback } from 'react';
import { FullScreen, useFullScreenHandle } from "react-full-screen";
import { withComponentFeatures } from 'universal-dashboard';
import { GoScreenFull } from "react-icons/go";
import { GoScreenNormal } from "react-icons/go";
const UDFullScreen = props => {

  const handle = useFullScreenHandle();
  return (
    <div key={props.id} className="UDFullScreen">
      <button onClick={handle.enter} style={{ ['background-color']: props.buttonColor, ['border-radius']: "8px" }}>
        <GoScreenFull style={{height: props.heightFull, width: props.widthFull}}/>
      </button>
      <FullScreen handle={handle}>
          {handle.active && (
            <button onClick={handle.exit} style={{ ['background-color']: props.buttonScolor, ['border-radius']: "8px" }}>
              <GoScreenNormal style={{height: props.heightNormal, width: props.widthNormal}}/>
            </button>
          )}
       {UniversalDashboard.renderComponent(props.content)}
      </FullScreen>
    </div>
  );
}

export default withComponentFeatures(UDFullScreen)