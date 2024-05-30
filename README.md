# AHK IMDb Mass List Import
This very basic Autohotkey Script allows you to import Movies based on title or IMDb code to your prefered IMDb List 

## How to import Movie Names or IMDb codes 
- You need to have Autohotkey installed.
- Prepare a text file with IMDb titles or IMDB codes(example: tt0137523), one per line
- Make sure the IMDb list edit page is open in the browser before running the script. You can create a List here: https://www.imdb.com/list/create/
- run this script 
- use the file picker to select your text file file 
- Let the script add your titles to your list on IMDb.

## Note
This script is a basic example and may need to be adjusted based on your specific requirements and environment.
You may need to adjust the sleep times and key presses based on your browser, internet connection and system settings.
Tested on Chrome / Chromium browser. Note: This script uses the AutoHotkey v2 syntax.

## Tipps and Tricks
- If a website provides a list of IMDb Links, use the Chrome Extension "Link Grabber" and filter the results. Afterwards strip down unwanted URL parts and keep the format like "tt0120382".
- Do not use external Links / URLs inside your IMDb List, otherwise it gets unlisted / set to private without notice - even the list is set on public.
