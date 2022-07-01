
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
% 
%   Fischer and Tatomir GCC 22   A snapshot sample on how COVID-19 impacted and holds up a mirror to European water education
% 
%   STATUS : BETA 1.1
%
%   This script was used to extract and make the figure 2, 3,4,5,6,7 and 8
%   of the manuscript "A snapshot sample on how COVID-19 impacted and holds
%   up a mirror to European water education" 
%
%   For pre-print see https://gc.copernicus.org/preprints/gc-2022-5/
%
%
%   B.M.C. Fischer '22  question etc. mailto: hydrodroplets@gmail.com
%
%   CC BY 4.0 License
%  
%   Matlab version >R2021
%   Matlab toolboxes used:
%
%       - wordcloud
%       - piechart
%       - bar chart
%       - histcounts
%  
%
%
%
%   LAST UP DATES: 20220624
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     

% Import data
    close all ;clc;
    
    I_datloc='a:\Users\....\Finalresponses.xlsx';  % write here path where data file is stored
    I_pltloc='a:\Users\...\Figure\';   % write here location to save figures 
    
    [~,I_txt]=xlsread(I_datloc,'data');  % important data from xls file

%% Make and plot Figure 2
Fig1 = figure('units','normalized','outerposition',[0 0 1 1]); 
    subplot(121)
        col=7;
        f_wordcloud(I_txt(2:end,col));  
    
        set(findall(gcf,'-property','FontSize'),'FontSize',14)      
        set(gca,'Position',[0.01 0.01 0.5 .93]);
        
% % Position 
    subplot(324)
        col=5;
 
        f_piechart(I_txt(2:end,col) );
            set(findall(gcf,'-property','FontSize'),'FontSize',14)
     
            annotation( 'textbox',[0.138247950896879 0.91545898781285 0.149893796004206 0.0351239669421486],'String',{'a) Field'},...
                'LineStyle','none','FitBoxToText','off','FontWeight','bold','FontSize', 18);
            annotation( 'textbox',[0.576733755313283 0.91545898781285 0.149893796004206 0.0351239669421486],'String',{'b) Position'},...
                'LineStyle','none','FitBoxToText','off','FontWeight','bold','FontSize', 18); % title font size doesnt work with wordcl so annotation
 
       T_Plot(1,I_pltloc,'Figure_2.jpg')
        


%% Make and plot Figure 2

Fig2 = figure('units','normalized','outerposition',[0 0 1 1]); 
    subplot(121)
        col=7;
        f_wordcloud(I_txt(2:end,col)) ;  
        set(findall(gcf,'-property','FontSize'),'FontSize',14)
    
        annotation( 'textbox',[0.138247950896879 0.91545898781285 0.149893796004206 0.0351239669421486],'String',{'a) Courses taught'},...
        'LineStyle','none','FitBoxToText','off','FontWeight','bold','FontSize', 24); % title font size doesnt work with wordcl so annotation
 
        set(gca,'Position',[0.02 0.01 0.5 .93]);

% % Q5 Teaching level 
    subplot(222)
        col=6;
        f_piechart(I_txt(2:end,col) );
        title('b) Course level' ,'FontSize', 24);subtitle(' ')
        set(findall(gcf,'-property','FontSize'),'FontSize',14)

% % Q7 # Students 
    subplot(224)
        col=8;
        f_piechart(I_txt(2:end,col) );
        title('c) The number of students per course' ,'FontSize', 20);subtitle(' ');
        set(findall(gcf,'-property','FontSize'),'FontSize',14);

       T_Plot(1,I_pltloc,'Figure_3.jpg');

%% Make and plot Figure 4
Fig3 = figure('units','normalized','outerposition',[0 0 1 1]); 
    subplot(121)
        col=9;
    
    
        r=rectangle('Position', [0, 0.5, 29, 9], 'EdgeColor', 'none', 'FaceColor', [0.8 0.8 0.8] );hold all; % grade boxes in the background 
        alpha(r,.7) ; 
        r=rectangle('Position', [0, 10, 29, 6], 'EdgeColor', 'none', 'FaceColor', [0.8 0.8 0.8] );hold all;
        alpha(r,.7) ;
        r=rectangle('Position', [0, 17, 29, 1], 'EdgeColor', 'none', 'FaceColor', [0.8 0.8 0.8] );hold all;
        alpha(r,.7) ; 
    
        f_barCS(I_txt(2:end,col)); hold all;
        alpha(1) ; 
        
        y=[0,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]; % manual extracted data changes due to Covid-19
        x=[2,1,8,2,7,3,4,6,8,9,12,2,3,10,2,14,28,];
    
        plot(x,y,'|','Markersize',20,'LineWidth',2,'color',[0.850980392156863 0.325490196078431 0.0980392156862745],'MarkerFaceColor',[0.850980392156863 0.325490196078431 0.0980392156862745]);
        for l=2:size(x,2)
            plot([0 x(l)],[y(l)-0.4 y(l)-0.4],'LineWidth',1.25,'color',[0.850980392156863 0.325490196078431 0.0980392156862745],'MarkerFaceColor',[0.850980392156863 0.325490196078431 0.0980392156862745]);
            plot([0 x(l)],[y(l)+0.4 y(l)+0.4],'LineWidth',1.25,'color',[0.850980392156863 0.325490196078431 0.0980392156862745],'MarkerFaceColor',[0.850980392156863 0.325490196078431 0.0980392156862745]);
        end
        annotation('textbox',[0 0.00516528925619837 0.51 0.13],...
                'String',{'Remote lab/ field work'},'LineStyle','none','FitBoxToText','off' ,'FontSize', 14);
        
        h1=text(23,17.5,'🍎');
        h2=text(23.2,13,'⚒');
        h3=text(24,5,'🍍','FontWeight','bold','Color',[0.850980392156863 0.325490196078431 0.0980392156862745]);  set(h3,'Rotation',25,'HorizontalAlignment','center');
        hold off
        
        title('a) Teaching format' ,'FontSize', 20);subtitle(' ');
    
    subplot(222)   
        col=10; % %% Q9 CAT's 
        f_piechart(I_txt(2:end,col) );
        
        set(findall(gcf,'-property','FontSize'),'FontSize',14);
        
        annotation('textbox',[0.47 0.5 0.51 0.13],...
            'String',{'#[Socrative,Kahoot x 3,ARSnova,Moodle,Questionnaire,','GoogleForm,Exam software,Mentimeter,Quizz,Peer review x 2]'},...
             'HorizontalAlignment','center','VerticalAlignment', 'bottom','LineStyle','none','FitBoxToText','off','FontSize', 12,'color',[.5 .5 .5]); % title font size doesnt work with wordcl so annotation
        
    title('b) Use of CATs in course' ,'FontSize', 20);subtitle(' ') ;
        
     subplot(224)  %% Q10 Type of exam
        col=11;
%         f_piechart(I_txt(2:end,col) );
        f_barCS(I_txt(2:end,col)); hold all;
            set(findall(gcf,'-property','FontSize'),'FontSize',14);
            set(gca,'Position',[0.61 0.11 0.33465909090909 0.341162790697674]);

            set(h1,'FontSize', 30);set(h2,'FontSize', 29);set(h3,'FontSize', 46);

            annotation( 'textbox',[0.48 0.44 0.30076361587494 0.0351239669421484],'String',{'c) Examination format'},...
                'LineStyle','none','FitBoxToText','off','FontWeight','bold','FontSize', 14); % title font size doesnt work with wordcl so annotation
 
              
        y=[0 4,6,2];        % manual extracted data changes due to Covid-19
        x=[2, 1,6,15 ];


        %{'Oral 1 4 ','No 2 0 ','Yes2','WE closed book 4 6','Maybe6','WE open book  15 2'};
        plot(x,y,'|','Markersize',20,'LineWidth',2,'color',[0.850980392156863 0.325490196078431 0.0980392156862745],'MarkerFaceColor',[0.850980392156863 0.325490196078431 0.0980392156862745]);
        for l=2:size(x,2)
            plot([0 x(l)],[y(l)-0.4 y(l)-0.4],'LineWidth',1.25,'color',[0.850980392156863 0.325490196078431 0.0980392156862745],'MarkerFaceColor',[0.850980392156863 0.325490196078431 0.0980392156862745]);
            plot([0 x(l)],[y(l)+0.4 y(l)+0.4],'LineWidth',1.25,'color',[0.850980392156863 0.325490196078431 0.0980392156862745],'MarkerFaceColor',[0.850980392156863 0.325490196078431 0.0980392156862745]);
        end
    
        annotation('textbox',[0.509463722397476 0.00516528925619837 0.51 0.13],...
            'String',{'No/unknown'},'LineStyle','none','FitBoxToText','off' ,'FontSize', 14);
        
     T_Plot(1,I_pltloc,'Figure_4.jpg');
%% Make and plot Figure 5
FigH = figure('units','normalized','outerposition',[0 0 1 1]); 
       
    col=12; % Covid measures
    subplot(311)
        f_wordcloud(I_txt(2:end,col)) ;  
        set(findall(gcf,'-property','FontSize'),'FontSize',14);
        
   
        set(gca,'Position',[0.1 0.35 0.8 .7]);  
    
        col=16; % technical aids 
    subplot(313)
        f_wordcloud(I_txt(2:end,col)) ;
        set(gca,'Position',[0.05 0.01 0.9 .4]);  
        
        set(findall(gcf,'-property','FontSize'),'FontSize',14);
    
        annotation( 'textbox',[0.0383531033679621 0.939219318391362 0.483728915559483 0.0351239669421485],'String',{'a) Covid measure to continue teaching'},...
            'LineStyle','none','FitBoxToText','off','FontWeight','bold','FontSize', 22); % title font size doesnt work with wordcl so annotation
   
        annotation( 'textbox',[0.0383531033679621 0.425789566325247 0.483728915559483 0.0351239669421485],'String',...
            {'b) technical aids did you use to continue teaching'},...
            'LineStyle','none','FitBoxToText','off','FontWeight','bold','FontSize', 22); % title font size doesnt work with wordcl so annotation
  
    T_Plot(1,I_pltloc,'Figure_5.jpg')

 
%% Make and plot Figure 6 
FigH = figure('units','normalized','outerposition',[0 0 1 1]); 

    col=13;
    subplot(334)
        f_Timescale(I_txt(2:end,col)) ;
    
    col=14; % X time teaching 
    subplot(335)
        f_Timescale(I_txt(2:end,col)) ;
    %  X time teaching 
    col=15;
    subplot(336)
        f_Timescale(I_txt(2:end,col)) ;
    
        annotation('textbox',[0.0693388307182225 0.91 0.483728915559482 0.0351239669421484],...
            'String',{'a)'},'LineStyle','none','FontSize',22,'FitBoxToText','off','FontWeight','bold','FontSize', 22);
        annotation('textbox',[0.438385447172014 0.91 0.483728915559482 0.0351239669421484],...
            'String',{'b)'},'LineStyle','none','FontSize',22,'FitBoxToText','off','FontWeight','bold','FontSize', 22);
        annotation('textbox',[0.698193227084807 0.91 0.483728915559481 0.0351239669421484],...
            'String',{'c)'}','LineStyle','none','FontSize',22,'FitBoxToText','off','FontWeight','bold','FontSize', 22);
        annotation('textbox',[0.18 .76 0.230871474223944 0.0351239669421484],...
            'String',{'Prepare teaching activity'},'LineStyle','none','FontSize',18,'FitBoxToText','off');
        annotation('textbox',[0.478343386183581 .76 0.23196155598256 0.0351239669421484],...
            'String',{'Teaching activity'},'LineStyle','none','FontSize',18,'FitBoxToText','off');
        annotation('textbox',[0.73 0.76 0.483728915559481 0.0351239669421484],...
            'String',{'Wrap up teaching activity'},'LineStyle','none','FontSize',18,'FitBoxToText','off'); 

    T_Plot(1,I_pltloc,'Figure_6.jpg')        
      
 
%% Make and plot Figure 7.1
    FigH = figure('units','normalized','outerposition',[0 0 1 1]);        
    
        subplot(2,2,1)
        col=18; 
                f_piechart(I_txt(2:end,col)) ;  % changes in the learning outcomes? 
                title([{'a) Changes in the learning outcomes?'};{' '}]);
        % Q18 % Q19
        subplot(2,2,2)
        col=20; 
                f_piechart(I_txt(2:end,col)) ;  % Different examinantion?
                title([{'b) Different examinantion?'};{' '}]);
    
        % Q19 & Q20 Different examination? Y/N and format
    
        % Q21 teachers point positive or negative  / negative development 
        subplot(2,2,3)
        col=22; 
                f_piechart(I_txt(2:end,col)) ;  % Different examinantion?
                title([{'c) Teaching changed, teachers point of view'};{' '}]);
    
        % Q23 Students could focus? 
    
        subplot(2,2,4)
        col=24; 
                f_piechart(I_txt(2:end,col)) ;  % Different examinantion?
                title([{'d) Students could focus? '};{' '}])
	    
                set(gcf,'color','w');
        
                set(findall(gcf,'-property','FontSize'),'FontSize',14);
       
                 T_Plot(1,I_pltloc,'Figure_7_1.jpg')

%% Make and plot Figure 7.2
% Q24 Students reached learning goals and Q27 student performance 
FigH = figure('units','normalized','outerposition',[0 0 1 1]); 
    subplot(2,2,1)
    col=25; 
            f_piechart(I_txt(2:end,col)) ;  % Different examinantion?
            title([{'e) Students reached learning goals during Covid19 time'};{' '}])

    subplot(2,2,2)
    col=28; 
            f_piechart(I_txt(2:end,col)) ;  % Different examinantion?
            title([{'f) Students performance changed compared to pre Covid19 time'};{' '}])


    % Q25 Students feedback , if negative how to improve 
    subplot(2,2,3)
    col=26; 
            f_piechart(I_txt(2:end,col)) ;  % Different examinantion?
            title([{'g) Students feedback'};{' '}])
    % Q26 differentce between 2020 spring and autmn semester ? 

    subplot(2,2,4)
    col=29; 
            f_piechart(I_txt(2:end,col)) ;  % Different examinantion?
            title([{'h) Difference between 2020 spring and autumn semester?'};{' '}])
    
            set(gcf,'color','w');
            set(findall(gcf,'-property','FontSize'),'FontSize',14);

           
          T_Plot(1,I_pltloc,'Figure_7_2.jpg')

%% Make and plot Figure 8
    FigH = figure('units','normalized','outerposition',[0 0 1 1]); 
    % subplot(5,2,[9 10])
    col=30; 
            f_wordcloud(I_txt(2:end,col)) ;  % Different examinantion?
%             f_barCS(I_txt(2:end,col)) ;  % Different examinantion?

            title([{'Which part in knowledge and skills in water education?'};{' '}])
        
            T_Plot(1,I_pltloc,'Figure_8.jpg')


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTIONS %%%%%%%%%%%%%%%%%%%%%%%%
% here are functions used in the main script
%

% word cloud
function f_wordcloud(data )
    t_data=string(data);
    [numOccurrences,uniqueWords] = histcounts(categorical(t_data));

    wordcloud(uniqueWords,numOccurrences,'Shape','oval');
         
    set(gcf,'color','w');  
end

% make pie chart
function f_piechart(data )

    [numOc,uWrd] = histcounts(categorical(data));

    for l=1:size(numOc,2)
        comtxt(l) = append(uWrd(l),': ',num2str(round((numOc(l)/sum(numOc))*100)),'%');
    end
    
        pieHandle = pie(  numOc,comtxt);

        pieAxis = get(pieHandle(1),'Parent' );  
        pieAxisPosition = get(pieAxis, 'Position');
            newRadius = .25;   % Change the radius of the pie chart
            deltaXpos = 0;    % Move axis position left or right
            deltaYpos = 0;    % Move axis position up or down
        
         
        set(pieHandle,'LineWidth',1.25)  
        set(gcf,'color','w');  
end

% make bar plot
function f_barCS(data)  
    [numOc,uWrd] = histcounts(categorical(data));
    [numOc,I]=sort(numOc,'ascend');
    uWrd=uWrd(I);
        
    barh(1:1:size(uWrd,2),numOc);hold all;
        set(gca, 'XTick', 1:1:29);
        set(gca, 'YTick', 1:length(uWrd),'YTickLabel',uWrd);
    xline(29,'LineWidth',1.5);
        
    set(gcf,'color','w'); 
    ax = gca; % Get handle to current axes.
    ax.XColor = [1 1 1]; 
    ax.YColor = [0 0 0];
     
    for l=1:29
        plot([l l],[0 .5],'linestyle','-','color',[0 0 0]); 
        h=text(l,-1.2,num2str(l));        set(h,'Rotation',90,'HorizontalAlignment','center');
    end
    box off

end

% make time plot
function f_Timescale(data)

[numOc,uWrd] = histcounts(categorical(data));

    plot([-100 -120],[1 1],'linewidth',2,'color',[.5 .5 .5])
    h1=text(2,1.25,'⏰','Fontsize',50,'HorizontalAlignment','center');    
    
    if size(uWrd,2)==2
        h2=text(0.8,1.25,'Less   -','Fontsize',18,'HorizontalAlignment','right');
        h2=text(2,2.5,[uWrd(2)],'Fontsize',18,'HorizontalAlignment','center');
        h2=text(2,2,['I'],'Fontsize',14,'HorizontalAlignment','center');
        h3=text(3,1.25,uWrd(1),'Fontsize',18,'HorizontalAlignment','left');
        h4=text(2,-.9,num2str(numOc(2)),'Fontsize',18,'HorizontalAlignment','center');
        h5=text(4,-.9,num2str(numOc(1)),'Fontsize',18,'HorizontalAlignment','center');    
    elseif size(uWrd,2)==3
        h2=text(0.8,1.25,[uWrd(2)],'Fontsize',18,'HorizontalAlignment','right');
        h3=text(2,2.5,[uWrd(3)],'Fontsize',18,'HorizontalAlignment','center');
        h3=text(2,2,['I'],'Fontsize',14,'HorizontalAlignment','center');
        h4=text(3,1.25,[uWrd(1)],'Fontsize',18,'HorizontalAlignment','left');
        
        h5=text(0,-.9,num2str(numOc(2)),'Fontsize',18,'HorizontalAlignment','center');
        h6=text(2,-.9,num2str(numOc(3)),'Fontsize',18,'HorizontalAlignment','center'); 
        h7=text(4,-.9,num2str(numOc(1)),'Fontsize',18,'HorizontalAlignment','center');        
    end    
    
    xlim([-2 4]);
    ylim([-1 2]);
    
    ax = gca; % Get handle to current axes.
    ax.XColor = [1 1 1]; 
    ax.YColor = [1 1 1];
end
 
function T_Plot(ynplt,I_pltloc,I_plotnameoc)
    %%%%%%%%% PLOT export (uncomment parts if needed)
    %
    set(gcf,'color','w');
    set(findall(gcf,'-property','FontSize'),'FontSize',14);
    % set(gcf, 'PaperOrientation', 'portrait');
    set(gcf, 'PaperOrientation', 'landscape');
    
    set(gcf, 'PaperType', 'A3');
    
    if ynplt==1   % 1 = plot , 0 not plot
          print([I_pltloc I_plotnameoc],'-djpeg','-r300','-vector'); 
    end

end
