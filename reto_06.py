tirada=input()
def pptls(tirada):
    p1=0
    p2=0
    for x in tirada:
        if x[0] == "🗿" and x[1] == "✂️" or x[0] == "🗿" and x[1] == "🦎":
            p1 += 1
        if x[0] == "📄" and x[1] == "🗿" or x[0] == "📄" and x[1] == "🖖":
            p1 += 1
        if x[0] == "✂️" and x[1] == "📄" or x[0] == "✂️" and x[1] == "🦎":
            p1 += 1  
        if x[0] == "🦎" and x[1] == "📄" or x[0] == "🦎" and x[1] == "🖖":
            p1 += 1
        if x[0] == "🖖" and x[1] == "✂️" or x[0] == "🖖" and x[1] == "🖖":
            p1 += 1
        if x[0] == "🗿" and x[1] == "📄" or x[0] == "🗿" and x[1] == "🖖":
            p2 += 1
        if x[0] == "📄" and x[1] == "✂️" or x[0] == "📄" and x[1] == "🦎":
            p2 += 1
        if x[0] == "✂️" and x[1] == "🗿" or x[0] == "✂️" and x[1] == "🖖":
            p2 += 1  
        if x[0] == "🦎" and x[1] == "🗿" or x[0] == "🦎" and x[1] == "✂️":
            p2 += 1
        if x[0] == "🖖" and x[1] == "📄" or x[0] == "🖖" and x[1] == "🦎":
            p2 += 1
    if p1>p2:
       print("p1 win") 
    if p1<p2:
       print("p2 win") 
    if p1==p2:
        print("tie")   
    print(p1,p2)   
pptls(tirada)                

       
       
        
       
        
        
        
        
        
        



    #if tirada[1][1] == "🗿" and tirada[1][2] == "✂️" or tirada[1][2] == "🖖":
        