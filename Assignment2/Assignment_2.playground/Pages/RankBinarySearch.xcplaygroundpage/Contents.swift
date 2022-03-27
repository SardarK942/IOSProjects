import Darwin
func rank(numbers: [Int], key: Int) -> Int {
    //binarySearch code here
    var left = 0;
    var right = numbers.count-1;
    
    while left <= right{
        let mid = Int(floor( Double((left+right))/2.0) );
        
        if (numbers[mid] < key) {
            left = mid+1;
        }
        else if(numbers[mid] > key){
            right = mid-1;
        }
        else{
            print(mid)
            return mid
        }
        
    }
    print("Not Found sorry bro")
    return -1;
}

let array = [8, 0, 3, 4, 5, 36, 10, 2, 1].sorted();

rank(numbers: array, key: 36);
