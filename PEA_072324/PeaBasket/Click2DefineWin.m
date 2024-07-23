function xPTS = Click2DefineWin(data)

figure; 
set(gcf, 'Position', get(0, 'Screensize'));
plot(data,'k');
title('Zoom in if necessary then press any key to select')
pause;

mflag = false; bflag = false; xPTS = [];
while ~mflag
    while ~bflag
        [x,y,button] = ginput(1); %button
        
        if button == 1
            hold on;
            xline(x,'r');
            bflag = true;
            xPTS = [x xPTS]; %xPTS
            bflag = false;
        end

        if button==3 % Right click to finish
            
            mflag = true; 
            msgbox('Manual selection completed')
            break;
        end
    end

    
end

close all;