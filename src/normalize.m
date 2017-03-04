function [val]=normalize(A)
minval=min(A);
maxval=max(A);
val=(A-minval)/(maxval-minval);