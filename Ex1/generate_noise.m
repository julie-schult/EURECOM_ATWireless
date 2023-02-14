function w = generate_noise(num_elem)
    w = zeros(1, 3);
    for i = 1:num_elem
        w(i) = 1/sqrt(2)*(normrnd(0, 1) +1i*normrnd(0,1));
    end
end