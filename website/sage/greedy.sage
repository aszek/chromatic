############ GREEDY COLORING ALGORITHM ################

#To test our method we need some graph. Let's take a random graph
n=10
randG = graphs.RandomGNP(n, 0.4)

#And let's take a random permutation of its vertices
#Note: V={0..n-1}, so we need to shift the random permutation by 1
#Random permutation
randP = [x-1 for x in Permutations(n).random_element()]

#The greedy coloring method
#Arguments: g - graph with V={0..n-1}, p - permutation of V
#Returns: a coloring, a list c[0..n-1], where c[i] is the color of vertex i
def GreedyColoring(g, p):
    n = g.num_verts()
    c = [-1 for i in [0..n-1]]            #Final answer, we initialize it with "dumb" values

    for i in [0..n-1]:
        vertex = p[i]                     # The currently colored vertex
        #Now: Find the smallest color not used for p[0],..,p[i-1]
        available = [0..n-1]              #First all colors are available
        for j in [0..i-1]:
            #Here we look at an already colored vertex p[j]
            #And remove its color from the available ones, if necessary
            if g.has_edge(vertex, p[j]) and c[p[j]] in available:
                available.remove(c[p[j]])
        c[vertex] = min(available)
    return c

#Let's test our method
#Find the coloring of our random example
randCol = GreedyColoring(randG, randP)

#Convert this coloring into a partition of the vertex set
partition = [ [x for x in randG.vertices() if randCol[x] == k] for k in [0..max(randCol)] ]

#Plot the graph with colorful partition
randG.show(partition=partition)