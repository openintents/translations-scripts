Instructions for automatically translating all OI apps at Launchpad
===================================================================

The local directory layout of github repositories must be the following:
    - aboutapp                    (aboutapp.git)
    - convertcsv                  (convertcsv.git)
    - ...
    - shoppinglist                (shoppinglist.git)
    - translations/descriptions   (translations_description.git)
    - translations/export         (translations_export.git)
    - translations/import         (translations_import.git)
    - translations/scripts        (translations_scripts.git)

To synchronize all translations:

1. Synchronize translations/import with the output from Launchpad
   (bzr branch lp:~openintents-devs/openintents/translations)

2. Perform script in translations/scripts/update_all.bash

3. Push modifications to any of the other repositories to github.

