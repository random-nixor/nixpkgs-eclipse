
### eclipse launcher

problem:
* eclipse launcher resolves symlinks to obtain "eclipse_home" location
* then it uses "eclipse_home" to locate "dropings", "eclipse.ini", etc
* this makes `buildEnv` forest unusable for purpoeses of "dropins", "eclipse.ini"

solution:
* use explicit `--launcher.ini=/path/eclipse.ini` 
  in wrapper to specify "eclipse.ini"
* use explicit `-Dorg.eclipse.equinox.p2.reconciler.dropins.directory=/path/dropins` 
  in wrapper to specify "dropins"

exposure:
* in order to expose live eclipse install for review
* use both `buildEnv` forest and explicist wrapper overrides  
