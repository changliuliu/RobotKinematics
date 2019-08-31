function handle=Draw(robot,mode)
M=CapPos(robot);
clf; hold on;
switch mode
    case "CAD"
        robotCAD = load(strcat('figure/',robot.name,'.mat'));
        switch robot.name
            case 'M16iB'
                scale = 1/1000;
            case 'LRMate200iD7L'
                scale = 1/1000;
            otherwise
                scale = 1;
        end
        
        % base
        for i=1:numel(robotCAD.base)
            f=robotCAD.base{i}.f; v=robotCAD.base{i}.v.*scale; c=robotCAD.base{i}.c; color=robotCAD.base{i}.color;
            v = setVertice(v,M{1});
            handle.base(i) = patch('Faces',f,'Vertices',v,'FaceVertexCData',c,'FaceColor',color,'EdgeColor','None');
        end
        % Link
        for i=1:length(robotCAD.link)
            v=robotCAD.link{i}.v.*scale; f=robotCAD.link{i}.f; c=robotCAD.link{i}.c; color=robotCAD.link{i}.color;
            v = setVertice(v,M{i+1});            
            handle.link(i) = patch('Faces',f,'Vertices',v,'FaceVertexCData',c,'FaceColor',color,'EdgeColor','None');
            if i==1 || i==3
                for k=1:4
                    if isfield(robotCAD.link{i}, 'motor')
                        v=robotCAD.link{i}.motor{k}.v.*scale; f=robotCAD.link{i}.motor{k}.f; c=robotCAD.link{i}.motor{k}.c; color=robotCAD.link{i}.motor{k}.color;
                        v = setVertice(v,M{i+1});
                        handle.motor(i,k) = patch('Faces',f,'Vertices',v,'FaceVertexCData',c,'FaceColor',color,'EdgeColor','None');
                    end
                end
            end
%           
%The following commentted part is used to draw current reference frames. This is
%useful when you try to add new robot model, you can find the mArrow3
%function at 
%   https://www.mathworks.com/matlabcentral/fileexchange/25372-marrow3-m-easy-to-use-3d-arrow
%
%             o = [0,0,0];
%             dx = [1,0,0];
%             dy = [0,1,0];
%             dz = [0,0,1];
%             orig_frame = [o; dx; dy; dz];        
%             frame = setVertice(orig_frame, M{i+1});
%             mArrow3(frame(1,:),frame(2,:),'color','r');
%             mArrow3(frame(1,:),frame(3,:),'color','g');
%             mArrow3(frame(1,:),frame(4,:),'color','b');
%
        end
        
        % Payload
        i = 7;
        if isfield(robotCAD, 'payload')
            v=robotCAD.payload.v.*scale;f=robotCAD.payload.f;c=robotCAD.payload.c;color=robotCAD.payload.color;
            v = setVertice(v,M{i});
            handle.payload(1) = patch('Faces',f,'Vertices',v,'FaceVertexCData',c,'FaceColor',color,'EdgeColor','None');
        end
    case "Capsule"
        valpha = 0.8;
        color = [0,1,0];
        load(strcat('figure/', robot.name, 'Capsules.mat'));
        boundary = RoBoundary;
        handle=[];
        n=min([size(M,2), length(boundary)]);
        for i=1:n
            if isfield(boundary{i}, "X")
                X=boundary{i}.X;
                Y=boundary{i}.Y;
                Z=boundary{i}.Z;
                kd=size(X,1);jd=size(X,2);
                for k=1:kd
                    for j=1:jd
                        newvec=[X(k,j),Y(k,j),Z(k,j)]*M{i}(1:3,1:3)'+M{i}(1:3,4)';
                        X(k,j)=newvec(1);
                        Y(k,j)=newvec(2);
                        Z(k,j)=newvec(3);
                    end
                end
                handle(i)=surf(X,Y,Z,'FaceColor',color,'EdgeColor','None');
                alpha(handle(i),valpha);
            end
        end
end
xlim=[-1,2];
ylim=[-1,1];
zlim=[0,2];
view([1,-0.5,0.4]);
axis equal
axis([xlim,ylim,zlim]);
lighting=camlight('left');
%lighting phong
set(gca,'Color',[0.8 0.8 0.8]);
wall{1}.handle=fill3([xlim(1),xlim(1),xlim(2),xlim(2)],[ylim(1),ylim(2),ylim(2),ylim(1)],[zlim(1),zlim(1),zlim(1),zlim(1)],[0.5,0.5,0.5]);
wall{2}.handle=fill3([xlim(1),xlim(1),xlim(1),xlim(1)],[ylim(1),ylim(1),ylim(2),ylim(2)],[zlim(1),zlim(2),zlim(2),zlim(1)],[0,0.9,0.9]);
wall{3}.handle=fill3([xlim(1),xlim(1),xlim(2),xlim(2)],[ylim(2),ylim(2),ylim(2),ylim(2)],[zlim(1),zlim(2),zlim(2),zlim(1)],[0,0.9,0.9]);
end