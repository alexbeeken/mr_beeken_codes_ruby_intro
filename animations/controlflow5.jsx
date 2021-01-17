#include '/Users/alex/Code/mr_beeken_codes_ruby_intro/helpers.jsx'

{
  var terminalActions = " \
  input:ruby controlflow5.rb;\
  output:2: no!
yes!
\n";

  var editorText = 'def check_num(number)
  if (number > 6 && number < 9)
    puts "yes!"
  else
    puts "no!"
  end
end

check_num(3)
check_num(7)
';

  app.beginUndoGroup("demo script");

  var currentProject = (app.project) ? app.project : app.newProject();

  var compSettings = cs = [1920, 1080, 1, 30, 25];
  var defaultCompName = 'Demo';
  var currentComp = (currentProject.activeItem) ? currentProject.activeItem : currentProject.items.addComp(defaultCompName, cs[0], cs[1], cs[2], cs[3], cs[4]);

  var backgroundLayer = currentComp.layers.addSolid([0.14, 0.14, 0.14], "Background", cs[0], cs[1], cs[2]);

  addWindow(currentComp, 'left', [1,1,1], [0,0,0]);
  addWindow(currentComp, 'right', [0,0,0], [1,1,1]);

  var terminalTextLayer = addTerminalText(currentComp, '$');
  var editorTextLayer = addFileText(currentComp, editorText);
  var chunks = terminalActions.split(';');
  var numberOfChunks = getArrayLength(chunks);
  var time = 1.0;

  for (var i = 0; i < numberOfChunks; i++) {
    var line = chunks[i].split(':');
    var animation = line[0];

    if (animation.indexOf('input') > -1) {
      var content = line[1];

      time = typeIn(terminalTextLayer, content, time, 0.1);
    } else if (animation.indexOf('output') > -1) {
      var delay = line[1];
      var content = line[2];

      time = time + parseFloat(delay);

      output(terminalTextLayer, content, time);
    };
  }

  app.endUndoGroup();
}
