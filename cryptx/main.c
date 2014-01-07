//
//  main.c
//  cryptx
//
//  Created by Jack on 7/01/2014.
//  Copyright (c) 2014 salmonapps. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>


int main(int argc, const char * argv[])
{

    char *inFile = NULL;
    char *outFile = NULL;
    int c;
    
    // Process options
    while ((c = getopt (argc, argv, "i:o:")) != -1)
        switch (c)
    {
        case 'i':
            inFile = optarg;
            break;
        case 'o':
            outFile = optarg;
            break;
        case '?':
            if (strchr("io", optopt))
                fprintf (stderr, "Option -%c requires an argument.\n", optopt);
            else if (isprint (optopt))
                fprintf (stderr, "Unknown option `-%c'.\n", optopt);
            else
                fprintf (stderr,
                         "Unknown option character `\\x%x'.\n",
                         optopt);
            return 1;
        default:
            abort ();
    }
    
    if (!inFile || !outFile)
    {
        printf("Usage: %s -i <infile> -o <outfile>\n", argv[0]);
        exit(1);
    }
    
    // Open input and output files
    FILE *fin = fopen(inFile, "rb");
    FILE *fout = fopen(outFile, "wb");
    
    if(!fin)
    {
        printf("%s: Can't open input file\n", argv[0]);
        exit(1);
    }
    
    if(!fout)
    {
        printf("%s: Can't open output file\n", argv[0]);
        exit(1);
    }
    
    char *buffer = malloc(1024);
    size_t numBytes;
    // Encrypt/decrypt
    while (!feof(fin))
    {
        numBytes = fread(buffer, sizeof(char), 1024, fin);
        
        //TODO xor
        for(int i=0; i<numBytes; i++) {
            buffer[i] = ~(buffer[i]);
        }
        
        if (fwrite(buffer, sizeof(char), numBytes, fout) != numBytes)
        {
            printf("%s: Error writing output file\n", argv[0]);
            exit(1);
        }
    }
    
    // Clean up
    fclose(fout);
    fclose(fin);
    free(buffer);
    
    return 0;
}

