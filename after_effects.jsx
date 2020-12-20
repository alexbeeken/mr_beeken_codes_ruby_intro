#include "helpers.jsx"

{

  app.beginUndoGroup("demo script");

  var currentProject = (app.project) ? app.project : app.newProject();

  var compSettings = cs = [1920, 1080, 1, 30, 25];
  var defaultCompName = 'Demo';
  var currentComp = (currentProject.activeItem) ? currentProject.activeItem : currentProject.items.addComp(defaultCompName, cs[0], cs[1], cs[2], cs[3], cs[4]);

  var backgroundLayer = currentComp.layers.addSolid([0.14, 0.14, 0.14], "Background", cs[0], cs[1], cs[2]);

  addWindow(currentComp, 'left', [1,1,1], [0,0,0]);
  addWindow(currentComp, 'right', [0,0,0], [1,1,1]);

  addTerminalText(currentComp, '$test text');
  addFileText(currentComp, 'test text');

  app.endUndoGroup();
}
