function clippted_value = clipping_function(data, minimal_value, step, number_of_step)
    %function that clip data
    %from minimal value + step * number of previous step
    %to  minimal value + step * number of step
    clippted_value = [];
    for i=1:length(data)
        if(data(i)<(minimal_value + number_of_step*step) && data(i)>(minimal_value + (number_of_step - 1)*step))
            clippted_value(end+1) = data(i);
        end
    end
end
