x = 5;


solver_opt = cmaes();
solver_opt.Seed = 0;
solver_opt.LBounds = 0;
solver_opt.UBounds = 10000000;


x = cmaes(@(x)f(x), x, [], solver_opt);

function  y = f(x)
    command = strcat("python exec.py ", num2str(x));
    [~, sy] = system(command);
    y = str2double(sy);
end