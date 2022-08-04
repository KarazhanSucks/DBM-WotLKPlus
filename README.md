# DBM-WotLKPlus (3.3.5a)

------------



Core addon backported from Retail by Barsoomx (https://github.com/Barsoomx/) and Zidras (https://github.com/Zidras/).
Thank them for most (if not all) of the features.

------------

Main purposes of this repo is to see if Cataclysm and MoP mods can be easily backported for use in the BlueRing server and tracking Mythic and Heroic modes of the other dungeons.

Raids will be added once the server progresses upto that point.


------------

# Installation Guide

## Removal of old configuration files
If coming from old DBM install (e.g. 5.40) all DBM config files should be deleted in the /WTF/Account directories or there will be errors.

## Removal of old DBM addon files
It's better to do a clean install of this addon into the /Interface/Addons directory. (Thus removing all other DBM folders prior to installing this new one.)

## Installation of Trimitor's map file Patch
Trimitor's (Discord: Trimitor#3873) patch has to be loaded last to be usable on the BlueRing client, therefore it has been renamed to Patch-Z. If there are any other patches you're using shift their letter up by one so that there aren't any duplicate patch-#.mpq files present. (E.g. Patch X, Y and Z exist already: existing X becomes W, existing Y becomes X, existing Z becomes Y, Map patch gets copied over; there shouldn't be any issues doing this.)
At this point in time there are no issues using Trimitor's map patch on BlueRing.

## Installation of DBM files
Copy over the DBM-# folders into the /Interface/Addons directory.
