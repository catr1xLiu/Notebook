package Sep2024.Q2740FindMinimumValueOfThePartition;

import java.util.Arrays;

public class Solution {
    public int findValueOfPartition(int[] nums) {
        Arrays.sort(nums);
        int minPartition = (int) 10e9;
        for (int i = 0; i < nums.length-1; i++)
            minPartition = Math.min(nums[i+1]-nums[i], minPartition);
        return minPartition;
    }
}