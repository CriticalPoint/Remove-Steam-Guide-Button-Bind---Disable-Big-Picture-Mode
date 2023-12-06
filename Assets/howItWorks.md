<!-- How it Works -->
## How It Works

Unless you're overly familiar with PowerShell, understanding the script itself may pose a challenge, so I've added comments throughout the file that correlate to this list, to help explain what it does, step-by-step...

1. Checks your PowerShell version (>7.0 required)
2. Searches for config.vdf and declares the file path.
3. Makes a Backup.  of config.vdf > config.vdf.BACKUP.1 > config.vdf.BACKUP.2, and so on...
4. Reads the file contents
5. Splits the content into an array
6. Create updated file lines array
7. Initialise a Counter for deleted strings
8. Iterates through, removing any 'Guide' binds
9. Update deleted string Counter
10. Add updated lines to new array
11. Join back to a string
12. Save the updated content to config.vdf
13. Output the number of binds that have been deleted to the console (verification)

I wanted to do this with non-greedy RegEx initially but it didn't cut it because of the lack of spacing around each string. Tough nut to crack.

I'm always happy to learn new and different ways - how would you have accomplished this?
