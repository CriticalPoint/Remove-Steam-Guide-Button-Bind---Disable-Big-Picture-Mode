<!-- How it Works -->
## How It Works

Unless you're overly familiar with PowerShell, understanding the script itself may pose a small challenge. To that end, I've added comments throughout the file, which correlate to this list.

Here's what it does, step-by-step.

1 - Checks your PowerShell version (>7.0 required)
2 - Declares the file path to your Steam install directory (default location)
3 - Makes a Backup of config.vdf > config.vdf.BACKUP.1 > config.vdf.BACKUP.2, etc
4 - Read the file contents to string
5 - Splits the contents into an array
6 - Creates a new array to store the updated lines
7 - Creates a variable to store the number of strings deleted
8 - Iterates through the lines to remove the binds
9 - Increments the 'number of strings deleted' variable, if different to original
10 - Adds the updated lines to the new array
11 - Joins them back into a string
12 - Saves the updated file content to the output file (config.vdf)
13 - Outputs (to the console) the number of binds that have been deleted (verification)

I initially wanted to do this with RegEx (non-greedy), but it didn't cut it because of the lack of spacing around the "guide:b4," string.
It's taken me all day to get here and so I look at it that as my first public PS script, I'm pretty darn proud of it!

I'd be happy to learn a different way, how would you have done it?
