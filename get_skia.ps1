Invoke-WebRequest -uri "https://github.com/aseprite/skia/releases/download/m102-861e4743af/Skia-Windows-Release-x64.zip" -Method "GET" -Outfile build/skia.zip

Expand-Archive build/skia.zip -DestinationPath "build/skia" -Force
