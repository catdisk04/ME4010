syms s
num=sym2poly((5*s+1)*(0.56*s+1)*4)
denom=sym2poly((s*s+1)*s)
CG=tf(num, denom)

step(CG)