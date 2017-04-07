#Computes a greedy coloring of a graph with respect to a vertex ordering
#Arguments: g - graph with V={0...n-1}, p - permutation of V
def greedyColoring(g, p):
    n = g.num_verts()
    colors = [-1 for i in [0..n-1]]
    for i in [0..n-1]:
        vertex = p[i]
        available = [0..n-1]
        for j in [0..i-1]:
            if g.has_edge(vertex, p[j]) and colors[p[j]] in available:
                available.remove(colors[p[j]])
        colors[vertex] = min(available)
    return colors

#######################################################

#Arguments: g - graph with V={0..n-1}, r - number of repetitions
#Finds the best out of r random greedy colorings
def colorRandomly(g, r):
    best = []
    n = g.num_verts()
    optimalNumber = n
    for i in [1..r]:
        testP = [x-1 for x in Permutations(n).random_element()]
        coloring = greedyColoring(g, testP)
        usedColors = max(coloring) + 1
        print usedColors,
        #Compare this to the coloring best so far
        if usedColors < optimalNumber:
            best = coloring
            optimalNumber = usedColors
    return best

###############################################
n=10

testG = graphs.RandomGNP(n,0.5)
testC = colorRandomly(testG, 5)

testPartition = [[x for x in testG.vertices() if testC[x]==j] for j in [0..max(testC)]]
testG.show(partition=testPartition)

#If G is sufficiently small you can trying comparing to the 
#actual chromatic number
#print testG.chromatic_number()
