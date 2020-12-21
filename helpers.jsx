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
};

var addTerminalText = function (comp, sourceText, startTime) {
  return addText(
    comp,
    sourceText,
    [43.2, 95.4],
    [0.16,0.98,0.11],
    40,
    ParagraphJustification.LEFT_JUSTIFY,
    'terminal text',
    startTime
  );
};

var addFileText = function (comp, sourceText, startTime) {
  return addText(
    comp,
    sourceText,
    [1001.2, 86.4],
    [0,0,0],
    30,
    ParagraphJustification.LEFT_JUSTIFY,
    'file text',
    startTime
  );
};

var addText = function (comp, sourceText, position, color, size, justify, name, startTime) {
  if (!startTime) {
    startTime = 0.0;
  }

  var newText = comp.layers.addText(sourceText);

  newText.name = name;
  newText.property('Position').setValue(position);

  var textProp = newText.property('Source Text');
  var textDocument = textProp.value;

  textDocument.fillColor = color;
  textDocument.fontSize = size;
  textDocument.justification= justify;

  textProp.setValueAtTime(startTime, textDocument);

  return newText;
};

var typeIn = function (textLayer, text, startTime, speed) {
  var textProp = textLayer.property('Source Text');
  var currentTextDoc = textProp.value;
  var currentText = currentTextDoc.text;

  textProp.setValueAtTime(startTime, currentText);

  var chars = text.split('');
  var accumulator = currentText;
  var time = startTime;

  for (var i = 0; i < chars.length; i++) {
    accumulator = accumulator.concat(chars[i]);
    var newText = new TextDocument(accumulator);

    textProp.setValueAtTime(time, newText);

    time = time + speed;
  };

  return time;
};

var output = function (textLayer, text, startTime) {
  var textProp = textLayer.property('Source Text');
  var currentTextDoc = textProp.valueAtTime(startTime, true);
  var currentText = currentTextDoc.text;
  var newText = currentText + '\n' + text + '$';

  textProp.setValueAtTime(startTime, newText);
};

var getArrayLength = function (array) {
  var len = 0;
  var i;

  for (i in array) {
    if (array.hasOwnProperty(i)) {
      len++;
    }
  }

  return len;
};
