// ColorTrack.qml

import QtQuick

Rectangle {
  id: root
  color: "black"
  height: parent.height
  width: parent.width
  property var idx: -1
  property var state: bridge.get_state()
  property var pos: ch_val_arr[idx]

  Rectangle {
    id: sled
  	height: 6
    width: parent.width
    y: pos * parent.height
	  anchors.left: parent.left

  }
  Rectangle {
    id: label_container
    height: 20
    width: 50
    rotation: 90
    anchors.centerIn: parent
    color: "transparent"
    Text {
      text: sled.y.toFixed(2)
	    anchors.centerIn: parent
      color: Qt.hsla(0.00, 0.00, 0.35, 1.00)
	  }
  }

  MouseArea {
    anchors.fill: parent
    drag {
      target: sled
	    axis:Drag.YAxis
	    maximumY: parent.height - sled.height; minimumY: 0
	  }
	  onPositionChanged: {
	    ch_val_arr[idx] = sled.y;
	    //main_ch_val_arr = bridge.sled_p_arr_to_ch_val_arr(main_sled_p_arr, 350);
	    //bridge.set_main_sled_p_arr(main_sled_p_arr);
	    //bridge.set_main_ch_val_arr(main_ch_val_arr);
	    //bridge.set_readout_arr();
	    //readout_arr = bridge.get_readout_arr();
	  }
  }
}
