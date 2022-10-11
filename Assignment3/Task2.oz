fun {Sum List}
if List.2 == nil then
        List.1
    else
        List.1 + {Sum List.2}
    end
end