#include "mex.h"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double *Cond;
    double *startId;
    double *alpha;
    double *index;
    int M,N;
    int i,j;
    
    Cond = mxGetPr(prhs[0]);
    M = mxGetM(prhs[0]);
    N = mxGetN(prhs[0]);
    startId = mxGetPr(prhs[1]);
    alpha = mxGetPr(prhs[2]);
    plhs[0] = mxCreateDoubleMatrix(1,1,mxREAL);
    index = mxGetPr(plhs[0]);

	for (i = startId[0]; i < N; i++)	
	{
        if (Cond[i-1] >= Cond[i])
        {
            continue;
        }
        else
        {
            for (j = i+1; j < N; j++)
            {
                if (Cond[j-1] <= Cond[j])
                {
                    continue;
                }
                else
                {
                    if (Cond[j-1] >= alpha[0]*Cond[i-1])
                    {
                        break;
                    }
                    else
                    {
                        break;
                    }
                }
            }
            if (Cond[j-1] >= alpha[0]*Cond[i-1])
            {
                break;
            }
        }
    }
    *index = i - 1;
}
