def all_subset_sums(nums):
    rec = [0]
    for x in nums:
        rec = rec + [x + y for y in rec]
    return sorted(set(rec))

def prune_delta(delta, lst):
    pruned = []
    last = float('-inf')
    for x in sorted(lst):
        if x > last + delta - 1:
            pruned.append(x)
            last = x
    return pruned

def adaptive_pruned_subset_sums(nums, delta):
    sums = all_subset_sums(nums)
    return prune_delta(delta, sums)

# Example usage:
# print(adaptive_pruned_subset_sums([1]*10, 1))
