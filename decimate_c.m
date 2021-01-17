function [sig_out] = decimate_c(sig_in, M, fcoef)
%  
len_in = length(sig_in);
len_fcoef = length(fcoef);
len_out = fix(len_in/M) +1;
%
% sample-rate reduction
downsampled = zeros(1, length(fcoef) +len_in-1);
downsampled(len_fcoef : len_in +len_fcoef-1) = sig_in(1 : len_in);
% filtering
sig_out =zeros(1,len_out);
for i_out=1:len_out
    for k=0:len_fcoef-1
        sig_out(i_out) = sig_out(i_out) + fcoef(k+1)*downsampled(M*(i_out-1) -k+len_fcoef);
    end
end