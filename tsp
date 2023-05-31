
r=int(input("Enter the rows: "))
dist_matrix=[]
for i in range(r):
    li=list(map(int,input().split()))
    dist_matrix.append(li)
for i in dist_matrix:
    print(i)

import sys
def nearest_neighbour(dist_matrix,unvisited,curr_city):
    nearest=sys.maxsize
    neighbour=None
    for city in unvisited:
        if dist_matrix[curr_city][city]<nearest:
            nearest=dist_matrix[curr_city][city]
            neighbour=city
    return nearest,neighbour

def tsp(dist_matrix):
    n=len(dist_matrix)
    Tourlist=[]
    Costlist=[]
    
    for j in range(n):
        tour=[j]*(n+1)
        unvisited=set(range(0,n))
        curr_city=j
        unvisited.remove(j)
        
        for i in range(1,n):
            dist,next_city=nearest_neighbour(dist_matrix,unvisited,curr_city)
            tour[i]=next_city
            curr_city=next_city
            unvisited.remove(curr_city)
        #tour[0]=j
        cost=sum(dist_matrix[tour[i]][tour[i+1]] for i in range(n-1))
        cost+=dist_matrix[tour[0]][tour[n-1]]
        Costlist.append(cost)
        Tourlist.append(tour)
        print(tour)
        print(cost)
    print(min(Costlist))
    index=Costlist.index(min(Costlist))
    print(Tourlist[index])
tsp(dist_matrix)



















import sys
def nearest_neighbour(curr,unvisited,matrix):
    nearest=sys.maxsize
    neighbour=None
    for city in unvisited:
        if(matrix[curr][city]<nearest):
            nearest=matrix[curr][city]
            neighbour=city
    return neighbour,nearest

def tsp_min(matrix,i):
    n=len(matrix)
    tour=[0]*(n+1)
    unvisited=set(range(1,n))
    cur_city=i
    for i in range(1,n):
        next_city,dist=nearest_neighbour(cur_city,unvisited,matrix)
        tour[i]=next_city
        cur_city=next_city
        unvisited.remove(next_city)
    tour[n-4]=0
    cost=sum(matrix[tour[i]][tour[i+1]] for i in range(n-1))
    cost+=matrix[tour[n-1]][tour[0]]
    return tour,cost

matrix=[]
r=int(input("Enter the entries rowwise: "))

for i in range(r):
    r=list(map(int,input().split()))
    matrix.append(r)
print("\nThe distance matrix is:\n")
for i in matrix:
    print(*i)

final_cost=[]
for i in range(0,len(matrix)):  
    tour,cost=tsp_min(matrix,i)
    print("Tour ",tour)
    print("Total cost ",cost)
    final_cost.append(cost)
    cost=0
print("Minimum cost: ",min(final_cost))
