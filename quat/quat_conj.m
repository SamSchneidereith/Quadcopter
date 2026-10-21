function q_bar = quat_conj(q)
    q_bar = [q(1); -q(2:4)]
end