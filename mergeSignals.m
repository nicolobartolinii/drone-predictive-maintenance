function [in1,in2,in3] = mergeSignals(in1,in2,in3)

    delete=find(~ismember(in1(:,2),in2(:,2)) | ~ismember(in1(:,2),in3(:,2)));
    in1(delete,:)=[];
    
    delete=find(~ismember(in2(:,2),in1(:,2)) | ~ismember(in2(:,2),in3(:,2)));
    in2(delete,:)=[];
    
    delete=find(~ismember(in3(:,2),in1(:,2)) | ~ismember(in3(:,2),in2(:,2)));
    in3(delete,:)=[];
    
    if(~(isequal(in1(:,2),in2(:,2)) & isequal(in1(:,2),in3(:,2))))
        error("Errore nel merging dei segnali")
    end

end