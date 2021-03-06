function [] = plotmanifolds(fixpt,eigvecs, sim_time)
% Here fixpt is a 2d point and eigvecs are the directions given from the
% jacobian matrix
    H_plus_dir = eigvecs(:,1);
    H_min_dir = eigvecs(:,2);
    H_plus_vec = zeros(2,2*sim_time); 
    H_min_vec = zeros(2,40);
    H_plus1 = fixpt + 0.00001*H_plus_dir;
    H_plus2 = fixpt - 0.00001*H_plus_dir;
    H_min1 = fixpt + H_min_dir/sqrt(3);
    H_min2 = fixpt - H_min_dir/sqrt(3);
    for t = 1:sim_time
        H_plus_vec(:,t) = H_plus1;
        H_plus_vec(:,2*sim_time-t+1) = H_plus2;
        [H_plus1(1), H_plus1(2)] = mapxy(H_plus1(1),H_plus1(2));
        [H_plus2(1), H_plus2(2)] = mapxy(H_plus2(1),H_plus2(2));
    end
    for t = 1:20
        H_min_vec(:,t) = H_min1;
        H_min_vec(:,40-t+1) = H_min2;
        [H_min1(1), H_min1(2)] = mapxy(H_min1(1),H_min1(2));
        [H_min2(1), H_min2(2)] = mapxy(H_min2(1),H_min2(2));
    end
    if ishandle(130)
        close(130);
    end
    figure(130);
    hold on
    scatter(H_min_vec(1,:),H_min_vec(2,:),'filled','red');
    plot(H_min_vec(1,:),H_min_vec(2,:),'red');
    scatter(H_plus_vec(1,:),H_plus_vec(2,:),'filled','blue');
    plot(H_plus_vec(1,:),H_plus_vec(2,:),'blue');
end