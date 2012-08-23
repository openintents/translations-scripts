Instructions for automatically translating all OI apps at Launchpad
===================================================================

The local directory layout of github repositories must be the following:

    oi/aboutapp                    (aboutapp.git)
    oi/convertcsv                  (convertcsv.git)
    oi/...
    oi/shoppinglist                (shoppinglist.git)
    oi/translations/descriptions   (translations_description.git)
    oi/translations/export         (translations_export.git)
    oi/translations/import         (translations_import.git)
    oi/translations/scripts        (translations_scripts.git)
    oi/wifiserver                  (wifiserver.git)

(The top directory name is arbitrary - "oi" is just an example. It is important that translation repositories are organized in subdirectories.)

To synchronize all translations:

1. Synchronize translations/import with the output from Launchpad
   (bzr branch lp:~openintents-devs/openintents/translations)

2. Perform script in translations/scripts/update_all.bash

3. Push modifications to any of the other repositories to github.

