# TotalSpaces workflow for Alfred.app

_Work in Progress_, I have some plans for this workflow, only the basic stuff is currently implemented.

## Install

0. You'll need to buy [Alfred's Powerpack](http://www.alfredapp.com/powerpack/), as only it supports workflows. Then you'll need to **buy** [TotalSpaces 2](http://totalspaces.binaryage.com/), as the ruby API for it works only for licensed version and is disabled for trial.

    Both those apps are worth it and could enhance your workflows significantly even if you're not using Spaces :)

1. You need to install TotalSpaces gem:

        [sudo] gem install totalspaces2

    Maybe I would make it work from the scratch using bundler or whatsoever, but hey.

2. Clone this repo into `workflows` folder of your Alfred's Preferences or download and double click on it.

## Use

Right now there is only one command: `s [space]`, which accepts either the space's number, or its name (or first letters of this name).

It is a basic stuff, but I'm planning to add things like displaying the list of all spaces, renaming them etc., but this is all in the future.

Enjoy!

## License

TotalSpaces.alfredworkflow is released under the [MIT license](www.opensource.org/licenses/MIT).
