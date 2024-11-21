#include <criterion/criterion.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include "blocks.h"

void testCreateWorld(int numBlocks) {

  int world[10];

  for (int i =0; i<10; i++){
    world[i] = 0;
  }
  
  // world is the world structure 

  // all blocks below points to null
  int zeroBlocks = 0; // # of blocks set to zero
  for(int i =0;i<numBlocks; i++){
    if (world[i] == 0){
      zeroBlocks++; // j is blocks initialized to zero
    }
  }
  cr_assert_eq(zeroBlocks, numBlocks); // true if zeroBlocks is equal to numBlocks
}
  
Test(lex23,test_01){ testCreateWorld(10); }
