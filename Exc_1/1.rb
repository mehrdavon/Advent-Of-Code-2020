require 'set'

# read the init file, remove line breaks \n and save each line as a separate element of the array initarray_str
initarray_str = File.readlines('F:\AOC\1_input.txt',  chomp: true)
#convert array elements from string to integer, sorting strings with numbers is bad bad
initarray_str = initarray_str.sort!
initarray_int = initarray_str.map(&:to_i)

p 'Begin Part 1'
# target value of the addition is 2020
target = 2020

#function for target result array calculation

def find_2_ints(ints, sum)
    already_seen = Set.new
    ints.each do |int|
    return [sum - int, int] if already_seen.include?(sum - int)
    already_seen.add(int)
  end
  nil
end

result_array = find_2_ints(initarray_int, target)

p 'Part 1 answer is:'
p result_array[0] * result_array[1]
p 'Part 1 elements were:'
p result_array[0]
p result_array[1]

p 'Begin Part 2'

def search_triplet(a,key)
    len=a.length
    a.sort!         #Any sorting technique can be chosen
    for i in 0...len-1
        sum= key-a[i]
      	left=i+1
        right=len-1
        while(left<right)
            if a[left]+a[right]==sum
                return a[i],a[left],a[right]
            elsif a[left]+a[right]>sum
                right-=1
            else
                left+=1
            end
        end
    end
    return -1
end

result2_array = search_triplet(initarray_int,target)
p 'Part 2 answer is:'
p result2_array[0] * result2_array[1] * result2_array[2]
p 'Part 2 elements were:'
p result2_array[0]
p result2_array[1]
p result2_array[2]
