# adaptive_pruned_subset_sum.sage

def all_subset_sums(nums):
    """
    Compute all subset sums of the input list nums.
    """
    sums = [0]
    for x in nums:
        sums += [x + y for y in sums]
    return sorted(set(sums))

def prune_delta(delta, sums):
    """
    Prune subset sums by removing sums closer than delta.
    """
    pruned = []
    last = None
    for x in sums:
        if last is None or x > last + delta - 1:
            pruned.append(x)
            last = x
    return pruned

def adaptive_pruned_subset_sums(nums, delta):
    """
    Compute pruned subset sums of nums with pruning parameter delta.
    """
    sums = all_subset_sums(nums)
    return prune_delta(delta, sums)

# Example usage if Sage environment is available
if __name__ == "__main__":
    nums = [1]*10 + [2]*10
    delta = 1
    result = adaptive_pruned_subset_sums(nums, delta)
    print("Adaptive pruned subset sums:", result)
