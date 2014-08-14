# TotalSpaces workflow for Alfred.app

_Work in Progress_, I have some plans for this workflow, only the basic stuff is currently implemented.

![Filtering spaces using Alfred.app](https://i.cloudup.com/nkNjlW22MM.gif)

## Install

0. You'll need to buy [Alfred's Powerpack](http://www.alfredapp.com/powerpack/), as only it supports workflows. Then you'll need to **buy** [TotalSpaces 2](http://totalspaces.binaryage.com/), as the [ruby API](https://github.com/binaryage/totalspaces2-api/tree/master/ruby) for it works only for licensed version and is disabled for trial.

    Both those apps are worth it and could enhance your workflows significantly even if you're not using Spaces :)

1. You need to install TotalSpaces gem:

        [sudo] gem install totalspaces2

    Maybe I would make it work from the scratch using bundler or whatsoever, but hey.

2. Clone this repo into `workflows` folder of your Alfred's Preferences or download and double click on it.

## Usage

### Switching to a space

The default keyword to trigger workflow is `ts`. You can then either start writing the name for the space you'd like to switch to, or press space to list all the spaces you have.

After that you can write letters to fuzzy match the space you need, so `ts dshbrd` would switch you to `Dashboard` space etc.

The space is not needed between the keyword, so you can switch really fast by writing something like `tsda`.

To make things even faster, you can rename the keyword to something with one letter, like `s` or `d`, but I would keep `ts` as a default, so it wouldn't conflict with other workflows.

### Moving current active window to a space

After you have selected a space and before you have selected it, you can hold the `ctrl` key, in that case selecting a space would move the current active window to this space instead of switching to it.

- - -

Enjoy!

## License

TotalSpaces.alfredworkflow is released under the [MIT license](www.opensource.org/licenses/MIT).
