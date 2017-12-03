       function permute_2(T,i1,j1)
        ! permute tensor of rank 2 for orders 2,1 = transpose(T)
        implicit none
        
        type(Tensor2), intent(in) :: T
        integer, intent(in) :: i1,j1
        
        type(Tensor2) :: permute_2
        
        permute_2%ab = transpose(T%ab)
        
       end function permute_2
       
       function permute_4(T,i1,j1,k1,l1)
        ! permute tensor of rank 4 for orders 1,3,2,4 or 1,4,2,3
        implicit none
        
        type(Tensor4), intent(in) :: T
        integer, intent(in) :: i1,j1,k1,l1
        
        type(Tensor4) :: permute_4
        integer i,j,k,l

c        hard-coded permutation
c        if (i1==1 .and. j1==3 .and. k1==2 .and. l1==4) then
c         forall(i=1:3,j=1:3,k=1:3,l=1:3) permute_4%abcd(i,j,k,l)
c     *                                         = T%abcd(i,k,j,l)
c        else if (i1==1 .and. j1==4 .and. k1==2 .and. l1==3) then
c         forall(i=1:3,j=1:3,k=1:3,l=1:3) permute_4%abcd(i,j,k,l)
c     *                                         = T%abcd(i,l,j,k)
c        else
c         permute_4%abcd = T%abcd
c        end if
        
         permute_4%abcd = reshape(T%abcd,(/3,3,3,3/),
     *                            (/0.d0/),(/i1,j1,k1,l1/))
        
       end function permute_4