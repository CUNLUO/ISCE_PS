function replace_ints_struct(badintids, mode)
%Mode=1: This will remove badintids from ints structure
%Mode=2: This will change ints structure back to the original
set_params
load(ts_paramfile)

switch mode
    case 1

        if(~exist([ts_paramfile '_orig']))
        command=['mv ' ts_paramfile ' ' ts_paramfile '_orig']
        mysys(command)
        end
        
        ints([badintids])=[];
        save(ts_paramfile,'dates','ints')
        
    case 2
        command=['mv ' ts_paramfile '_orig ' ts_paramfile]
        mysys(command)
end

        disp('MAY NEED TO CHANGE THE MASTER INT!')

set_params
load(ts_paramfile);