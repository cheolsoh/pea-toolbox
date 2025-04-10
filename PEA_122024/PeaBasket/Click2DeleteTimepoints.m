function winPTS = Click2DeleteTimepoints(data)

figure; 
set(gcf, 'Position', get(0, 'Screensize'));
plot(data,'k');hold on;
plot(find(isnan(data)),zeros(size(find(isnan(data)))), 'r.','MarkerSize',30)
xlabel('RIGHT Click to Exit','FontSize',30)
tempYlim = get(gca, 'YLim');
% pause;

mflag = false; bflag = false; xPTS = []; counter = 0;
winPTS = []; 
while ~mflag
    while ~bflag
        [x,y,button] = ginput(1); %button
        
        hold(gca,'off')
        plot(data,'k'); hold on;
        plot(find(isnan(data)),zeros(size(find(isnan(data)))), 'r.','MarkerSize',30)
        xlabel('RIGHT Click to Exit','FontSize',30)

        tempYlim = get(gca, 'YLim');

        for ib = 1:size(winPTS)
            fill([min(winPTS(ib,:)) min(winPTS(ib,:)) max(winPTS(ib,:)) max(winPTS(ib,:))],...
                [tempYlim(1) tempYlim(2) tempYlim(2) tempYlim(1)],[1 0 0],'FaceAlpha',.1 )
        end
        
        if button == 1
            
            xline(floor(x),'r');
            bflag = true;

            xPTS = [xPTS floor(x)]; %xPTS
            
            if mod(length(xPTS),2)==1 % if odd# of points
                title('\color{black}Click to define the \color{red}BEGINNING \color{black}of the window to remove','FontSize',30)
            elseif mod(length(xPTS),2)==0 % if odd# of points
                title('\color{black}Click to define the \color{red}END \color{black}of the window to remove','FontSize',30)
                
                tempPTS = [];
                for ip = 1:size(winPTS,1)
                    tempPTS = [tempPTS winPTS(ip,1):winPTS(ip,2)];
                end

                tempPTS = [tempPTS min(xPTS):max(xPTS)];

                if length(unique(tempPTS)) ~= length(tempPTS) % if overlapped
                     title({'\color{red}TIME WINDOWS OVERLAPPED !!!!';'Click again to define a new window.'},'FontSize',30)
                elseif length(unique(tempPTS)) == length(tempPTS) % if NOT overlapped
                    counter = counter+1; 
                    winPTS(counter,:) = xPTS;
                end
                
                xPTS=[];

                fill([min(winPTS(counter,:)) min(winPTS(counter,:)) max(winPTS(counter,:)) max(winPTS(counter,:))],...
                    [tempYlim(1) tempYlim(2) tempYlim(2) tempYlim(1)],[1 0 0],'FaceAlpha',.1 )
            end

            

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