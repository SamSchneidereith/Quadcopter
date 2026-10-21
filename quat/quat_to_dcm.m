function C = quat_to_dcm(q)
    q = quat_normalize(q); % Must be a normalized vector

    w = q(1);
    x = q(2);
    y = q(3);
    z = q(4);

    C = [
        1-2*(y^2+z^2), 2*(x*y-w*z),   2*(x*z+w*y);
        2*(x*y+w*z),   1-2*(x^2+z^2), 2*(y*z-w*x);
        2*(x*z-w*y),   2*(y*z+w*x),   1-2*(x^2+y^2)
    ];
end