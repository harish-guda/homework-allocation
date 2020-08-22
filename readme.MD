# Allocation of Homeworks to Teams (for Teaching)

Here's a simple way(s) to allocate homeworks to teams, if you need a one-to-one allocation. 

There are a variety of ways to achive this. Some simple ways include: 

## Randomized Serial Dictatorship, 

Here you first choose a permutation of teams at random. Fixing this sequence, in each round, you assign the most preferred case to the team in the top of the sequence, and eliminate the team and case for the remainder of the matching. This mechanism has very nice structural properties (See Wikipedia article [here](https://en.wikipedia.org/wiki/Random_serial_dictatorship)). 

## Minimize Cumulative Regret

An integer program to minimize the cumulative regret of all students, where regret of team i = the preference index of the allotted object (case). 

