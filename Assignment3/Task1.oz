proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}
    local D P M in
            D = B*B-4.0*A*C
            P = (~B + {Float.sqrt D}) / (2.0*A)
            M = (~B - {Float.sqrt D}) / (2.0*A)
            if D >= 0.0 then
                RealSol = true
                X1 = P
                X2 = M
            else
                RealSol = false
                X1 = '-'
                X2 = '-'
            end
        end
end

