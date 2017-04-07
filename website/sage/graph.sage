def FunnyGraph(n):
    c = graphs.CompleteGraph(n)
    c.delete_edges(graphs.CycleGraph(n).edges())
    return graphs.MycielskiStep(c).join(graphs.WheelGraph(n+1))

G = FunnyGraph(99)

#What is \chi of G ?
