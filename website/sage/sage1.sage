#A crash-course of SAGE with a bit of graphs
#SAGE is built on top of the programing language Python and uses its syntax

#Comments start with #

#Arithmetic operations are as you'd expect
n = (2+3)%2-4^(14+2)
print n

#And so are relational and boolean operators, which return True or False
res = n<=0 and binomial(6,3)==20
print res

#Lists are the most useful data structures
L1 = ['a','b',34,'x']
L2 = [100,200,300,-400,-500,600]
L3 = [7..29]

A=[1..10]
B=[21..30]
C = [A[i]+B[i] for i in [0..9]]
d = sum([A[i]*B[i] for i in [0..9]])

print "C,d:", C, d

#We can iterate over elements of a list
for x in L1:
    print x
#Remark: Indentation is important! A nested block should be shifted by one TAB
#The online editor will suggest this by default

#Lists can be concatenated
print L1+L2

#Natural numbers, as well as list indices start from 0 !!
print L1[0], L1[1], L1[2], L1[3]

#The length of a list is len()
#The following also iterates through all elements of a list
for i in [0..len(L1)-1]:
    print L1[i]

#List substitution is the best way to operate on list elements
#1. Multiply all elements of a list by 100
L4=[100*x for x in L2]
print L4
#2. Multiply all positive elements of a list by 100
print [100*x for x in L2 if x>0]

#The conditional instruction
if n>0:
    print L1
else:
    print L2
#The else part is optional

#We can also define functions, and then call them
def RemoveZeros(list):
    return [x for x in list if x!=0]
print RemoveZeros([0,1,2,0,4,0])

#Graphs
#Almost everything in SAGE is an object, which can be accessed with the object's methods via a dot .
#Graphs are objects of a class called simply "Graph"

#This construct a graph with vertices 1,2,3,4 and edges 12,13,14,24
g = Graph([[1,2],[1,3],[1,4],[2,4]])
#The graph is constructed from a list of edges, each edge itself a 2-element list of vertices
#We can learn something about g: |V(G)|, |E(G)|, \Delta(G)
print g.num_verts(), g.num_edges(), max(g.degree_sequence()), g.chromatic_number(), g.clique_number()

#Some methods produce a new graph
h = g.complement()
print h.vertices(), h.edges(labels=False), h.is_connected()
print "alpha(G)=", h.clique_number()
#We could do the last thing in one line
print "alpha(G)=", g.complement().clique_number()
#Print out the list of neighbors for each vertex
for v in g.vertices():
    print v, ":", g.neighbors(v)

#Some standard graphs ar available from a library "graphs"
cycle9 = graphs.CycleGraph(9)
complete10 = graphs.CompleteGraph(10)
print cycle9.chromatic_number(), complete10.is_bipartite()
print graphs.PetersenGraph().chromatic_number()

#We can also visualize small graphs
g.show()

#We can also get a list of all graphs on a given number of vertices
#But don't try this for very large inputs
print [gr.num_edges() for gr in graphs(4)]

#See the documentation for a lot more functions operating on graphs


###############################################################
############# EXRECISES #######################################
#1. Prove that every graph on 6 vertices contains a clique of size 3 or an independent set of size 3
print "EXERCISE 1:"
for g in graphs(6):
    if g.clique_number()<3 and g.complement().clique_number()<3:
        print "Counterexample"
        g.show()
print "No counterexample"

#2. Find all graphs on 5 vertices for which the same claim fails.
print "EXERCISE 2:"
for g in graphs(5):
    if g.clique_number()<3 and g.complement().clique_number()<3:
        print "Counterexample"
        g.show()

#3. Write a function which takes two arguments:
#   1) a graph G with vertices 0..n-1 for some n
#   2) a list C of length n
#The function should check if C represents a coloring of G
#(the i-th entry on the list is the color assigned to the vertex number i)
print "EXERCISE 3:"
def IsColoring(G, C):
    for e in G.edges():
        if C[e[0]]==C[e[1]]:
            return False
    return True

#Test your function on this input
G = graphs.PetersenGraph()
C = [2,1,2,1,3,1,2,3,3,1]

print IsColoring(G, C)


#########################################################################
####### PLOTTING GRAPHS WITH VERTEX COLORS ##############################
print "Plotting colored graphs:"
graph = graphs.PetersenGraph()
color_partition = [[0,2,6],[1,3,5,9],[4,7,8]]
graph.show(partition=color_partition)
print "END"









