x = [0 0 20];
%s0: 0 20
%l0: 0 10
%v0: 20 40

%speed_limit: 50 100
%a_max_soft: 0.9 1.1
%a_min_soft: -4 -2
%

%robustness: max(|gy-s|-4, |gx-l|-12|) 

solver_opt = cmaes();
solver_opt.Seed = 0;
solver_opt.LBounds = [0 0 20];
solver_opt.UBounds = [20 10 40];
solver_opt.StopIter = 20;


x = cmaes(@(x)f(x), x', [], solver_opt);

function  y = f(x) %x = [s0, l0, v0, speed_limit, a_max_soft, a_min_soft]'
    command = strcat("python gen_conf.py ", num2str(x(1)), num2str(x(2)), num2str(x(3)));
        %gen_confv.py is a python script that creates a json file with the
        %values provided above, and execute the dynamic_cost.exe, and
        %analyze the log to get the 'robustness', finally it prints the
        %robustness
    [~, sy] = system(command);
    y = str2double(sy);
end