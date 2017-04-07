#The graph Q_d(u) constructed using sets and symmetric differences
def Qdu1(d,u):
    return Graph([[v, v.symmetric_difference(x)] for v in Subsets(d) for x in Subsets(d,u)], multiedges=False)

#The same graph using distances in the cube graph
def Qdu2(d,u):
    cube = graphs.CubeGraph(d)
    g = Graph()
    for v in cube.vertices():
        for w in cube.vertices():
            if v!=w and cube.distance(v,w)==u:
                g.add_edge(v,w)
    return g

#Using explicit bitwise representations of d-bit numbers
#^^ is the bitwise XOR operator
def Qdu3(d,u):
    return Graph([[x,y] for x in [0..2^d-1] for y in [x+1..2^d-1] if sum((x^^y).bits())==u])

#Q_3(2)
Qdu1(3,2).show()
Qdu2(3,2).show()
Qdu3(3,2).show()

#Chromatic number of R^5 is at least 8
#To speed up we look at just 1 connected component
print Qdu3(5,2).connected_components_subgraphs()[0].chromatic_number()

#Independence number of one component of Q_10(4) equals 20
print Qdu3(10,4).connected_components_subgraphs()[0].complement().clique_number()
#This can take around 20 minutes
#As a consequence, chi(R^10) >= 512/20 >=25.6, so chi(R^10)>=26







