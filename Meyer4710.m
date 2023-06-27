function[T] = Meyer4710(X)
    A = [1 1; -1 -1];
    T = A * X - X * A
end