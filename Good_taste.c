//Poor Taste Example according to Torvalds:
remove_list_entry(entry)
{
	prev = NULL;
	walk = head;
	//Walk the list
	while (walk != entry)
	{
		prev = walk;
		walk = walk->next;
	}
	//Remove the entry by updating the
	//head or previous entry
	if(!prev)//This is the part Torvalds hates
		head = entry->next;
	else
		prev->next = entry->next;
}

//Good Taste Example:
remove_list_entry(entry)
{
	indirect = &head;//The "indirect" pointer points to the *address* of the thing we'll update
	//Walk the list, looking for the thing that oints to the entry we want to remove
	while ((*indirect) != entry)
		indirect = &(*indirect)->next;
	*indirect = entry->next;
}

////////////////////////////////////////////////////////////

#define GRID_SIZE 64

//This is disgusting code

for (r = 0; r < GRID_SIZE; ++r) 
{
	for (c = 0; c < GRID_SIZE; ++c) //nested for loops suck
	{
		// Top Edge
		if (r == 0)
			grid[r][c] = 0;
		// Left Edge
		if (c == 0)
			grid[r][c] = 0;
		// Right Edge
		if (c == GRID_SIZE - 1)
			grid[r][c] = 0;
		// Bottom Edge
		if (r == GRID_SIZE - 1)
			grid[r][c] = 0;
	}
}

//This is slightly better
for (i = 0; i < GRID_SIZE * 4; ++i) 
{
	// Top Edge
	if (i < GRID_SIZE)
		grid[0][i] = 0;
	// Right Edge
	else if (i < GRID_SIZE * 2)
		grid[i - GRID_SIZE][GRID_SIZE - 1] = 0;
	// Left Edge
	else if (i < GRID_SIZE * 3)
		grid[i - (GRID_SIZE * 2)][0] = 0;
	// Bottom Edge
	else
		grid[GRID_SIZE - 1][i - (GRID_SIZE * 3)] = 0;
}

//Even better
for (i = 0; i < GRID_SIZE; ++i) 
{
	// Top Edge
	grid[0][i] = 0;
	// Bottom Edge
	grid[GRID_SIZE - 1][i] = 0;
	// Left Edge
	grid[i][0] = 0;
	// Right Edge
	grid[i][GRID_SIZE - 1] = 0;
}


//THE MORAL OF THE STORY IS TO TRY TO REMOVE EDGE CASES BY ELIMINATING CONDTIONALS WHERE YOU CAN, CONCEPTUALIZE WHAT NEEDS TO BE DONE BEFORE YOU EVER WRITE CODE