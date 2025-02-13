module day1
    function create_arrays_from_file(file_path::String)
        open(file_path) do file
            a = Int64[]
            b = Int64[]

            for line in eachline(file)
                numbers = split(line)

                push!(a, parse(Int64, numbers[1]))
                push!(b, parse(Int64, numbers[2]))
            end

            return a, b
        end
    end

    function part1(file_path::String)
        a, b = create_arrays_from_file(file_path)
        sort!(a)
        sort!(b)

        sum = 0
        for i in eachindex(a)
            sum += abs(b[i] - a[i])
        end

        return sum
    end

    function part2(file_path::String)
        a, b = create_arrays_from_file(file_path)

        sum = 0
        hashMap = Dict{Int64, Int64}()
        for i in eachindex(a)
            if !haskey(hashMap, a[i])
                hashMap[a[i]] = count(x -> x == a[i], b)
            end

            sum += a[i] * hashMap[a[i]]
        end

        return sum
    end
end

print(day1.part1("example.txt"))
print("\n")
print(day1.part1("input.txt"))
print("\n")
print(day1.part2("example.txt"))
print("\n")
print(day1.part2("input.txt"))