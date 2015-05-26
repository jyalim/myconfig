len = length
dc  = deepcopy

macro clear()
  run(`clear`)
end

macro timeit( expression )
  maxtime = 2. # seconds
  tic()
  expression
  dt = toq()
  maxiters = int( maxtime / dt )
  times = zeros(maxiters)
  println("Running for maximum of $maxtime seconds...")
  for k = 1:maxiters
    tic()
    expression
    times[k] = toq();
  end
  println("Number of iterations: $maxiters")
  println("Units:                seconds          ")
  println("Best time:            $(minimum(times))")
  println("Worst time:           $(maximum(times))")
  println("Average time:         $(sum(times)/len(times))")
end

macro LStrings()
  include("/Users/terra/.julia/mymods/latex.jl")
end

macro MyPyPlotHelp()
  println("plt.title(titlestr, y = 1.05 )")
end

function Id( n )
  #= Makes a square Identity Matrix (n by n) =#
  return diagm(ones(n))
end

function symplecticMatrix( n )
  #= Makes a square Symplectic Block Matrix Omega (2n by 2n)
  #  Ω = [ 0 I_n; -I_n 0 ]
  =#
  I = Id( n )
  Z = zeros(n,n);
  Ω = [ Z I; -I Z ] 
  return Ω
end

function symplecticTest( A, tol=1e-10 )
  #= 
    symplecticTest( A[,tolerance=1e-10])

    Tests if matrix is Symplectic with the SBM Omega.
      A must be a square matrix of size 2n by 2n.
      Also, A'*Ω*A - Ω < tol = 1e-10 by default.
    Returns Boolean.
  =#
  M,N = size(A)
  if M != N
    println("ERROR: MATRIX NOT SQUARE")
    return false
  elseif mod(M,2) != 0
    println("ERROR: MATRIX NOT 2n BY 2n")
    return false
  end
  tol = 1e-10
  n   = int(M / 2)
  Ω   = symplecticMatrix( n )

  if maximum(maximum(abs(A' * Ω * A - Ω))) < tol
    return true
  end
  return false
end

function tayCoefMatrix( q, j=q )
  A = ones(q+1,j+1)
  J = collect(0:j)
  for k = 1:q+1
    p = k - 1
    f = factorial(p)
    A[k,:] = J.^p ./ f                             # Note 0^0 := 1
  end
  return A
end

function minor( A, j, k )
  s = size(A);
  if s[1] != s[2]
    print("Error -- Matrix is nonsquare")
    return None
  end
  small_size = (2,2);
  if s == small_size
    return A
  end
  t = (s[1]-1,s[2]-1)
  B = zeros(t)
  vc = 1
  for v = 1:s[2]
    if v != k 
      uc = 1
      for u = 1:s[1]
        if u != j
          B[uc,vc] = A[u,v]
          uc += 1
        end
      end
    vc += 1
    end
  end
  return B
end

function diagDet( A )
  s = size(A)
  if s[1] != s[2]
    print("Error -- Matrix is nonsquare")
    return None
  end
  d = 0
  for k = 1:s[2]
    d += A[k,k] * det(minor(A,k,k))
  end
  return d
end

function welfertCheck( A )
  s = size(A)
  if s[1] != s[2]
    print("Error -- Matrix is nonsquare")
    return None
  end
  dd = diagDet(A)
  d  = det(A)
  return d - dd
end

function avg( a, slice=1 )
  return sum(avg,slice) / size(avg,slice)
end

function average( a, slice=1 )
  return avg(a, slice)
end
