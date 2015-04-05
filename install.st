" Change the content of this file with the code to load your application.
  Keep the last line, you don't want to keep the image running, that will be the
  job of start.st
"
| gitRepository |


FileStream stdout lf; nextPutAll: 'Installing PostgresV3...'; lf.

gitRepository := 'filetree://' , (FileLocator imageDirectory / 'repository') fullName.

Metacello new
  baseline: 'PostgresV3';
  repository: gitRepository;
  load.

FileStream stdout lf; nextPutAll: 'Done.'; lf.
Smalltalk snapshot: true andQuit: true.
