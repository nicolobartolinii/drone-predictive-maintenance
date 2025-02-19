function outData = zoh(varData, tIn, tOut)
    outData = zeros(length(tOut), size(varData,2));

    for i=1:length(tOut)
        idx = find(tIn <= tOut(i), 1, 'last');
        if isempty(idx)
            idx = 1;
        end
        outData(i,:) = varData(idx,:);
    end
end
