%Mem_alloc test
clc; clear;
N = 1e6;

[usr,sys] = memory;
preMem = usr.MemUsedMATLAB


A = randn(N,1) + 1i*randn(N,1);

[usr,sys] = memory;
usr.MemUsedMATLAB - preMem

B = A;

[usr,sys] = memory;
usr.MemUsedMATLAB - preMem

C=A(3:end);

[usr,sys] = memory;
usr.MemUsedMATLAB - preMem