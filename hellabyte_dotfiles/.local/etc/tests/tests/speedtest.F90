#define M 4*10**4
#define N real( M, 08 )**2
#define A '================ ADDITION ================='
#define S 'Time (seconds): '
#define G 'GFLOPS        : '
#define T 'Theoretical F : '
#define B '============= MULTIPLICATION =============='
#define C 'Note that second column should equal 0 if test is valid.'
#define D 'Multiplication is its own beast.'

program speedtest
    implicit none
    real*8 double, doubs, flops, theor, P
    integer*4 k, j
    integer*8 c1, c2, countRate, countMax
    
    c1 = 0; c2 = 0; countRate = 0; countMax = 0; double = 0.; P= 0.

    read (*,*) P

    call system_clock( c1, countRate, countMax )
    do k = 1, M
        do j = 1, M
            double = double + 1._08
        end do
    end do
    call system_clock( c2, countRate, countMax )
   
    print *, A
    print *, C
    print *, double, double - N
    doubs = real( c2 - c1, 08 ) / real( countRate, 08 )
    flops = N / ( doubs * 10._08 ** 9._08 )
    theor = P * flops
    print *, S, doubs
    print *, G, flops
    print *, T, theor 

    c1 = 0; c2 = 0; countRate = 0; countMax = 0; double = 1
    call system_clock( c1, countRate, countMax )
    do k = 1, M
        do j = 1, M
            double = double * 1.0000000125_08
        end do
    end do
    call system_clock( c2, countRate, countMax )
   
    print *, B
    print *, D
    print *, double, double / real( N , 08 )
    doubs = real( c2 - c1 ) / real( countRate )
    flops = N / ( doubs * 10 ** 9 )
    theor = P * flops
    print *, S, doubs
    print *, G, flops
    print *, T, theor 

    STOP
end program
