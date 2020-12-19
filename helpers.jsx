var addWindow = function (comp, side, stroke, fill) {
  var newWindow = comp.layers.addShape();

  newWindow.closed = true;
  newWindow.name = 'terminal window'; 

  var newGroup = newWindow.property('Contents').addProperty('ADBE Vector Group');
  newGroup.name = 'Terminal';

  var pathGroup = newWindow.property('Contents').property('Terminal').property('Contents').addProperty('ADBE Vector Shape - Rect');
  pathGroup.property('Size').setValue([928.4, 1042.9]);

  var position = [-477.8, -0.6];
  if (side == 'left') {
    position = [-477.8, -0.6];
  } else if (side == 'right') {
    position = [480.3, -2.0];
  }

  pathGroup.property('Position').setValue(position);

  var strokeGroup = newWindow.property('Contents').property('Terminal').property('Contents').addProperty('ADBE Vector Graphic - Stroke');
  strokeGroup.property('Color').setValue(stroke);

  var fillGroup = newWindow.property('Contents').property('Terminal').property('Contents').addProperty('ADBE Vector Graphic - Fill');
  fillGroup.property('Color').setValue(fill);
}
