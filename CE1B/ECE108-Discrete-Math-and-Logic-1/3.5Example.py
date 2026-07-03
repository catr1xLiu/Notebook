"""
Consider the following model where trust is a mathematical relationship T:
    - Everyone trusts oneself (T is reflexive)
    - If a trusts b and b trusts c, then a trusts c (T is transitive)
    - We have a set of acquaintances: A, B, C, D, E, F. And we know the following direct trusts:
        - A trusts B, C, D.
        - B trusts A, C, F.
        - C trusts A, B.
        - D trusts E.
        - E trusts D.
"""

from copy import deepcopy as dcp

INITIAL_TRUSTS: dict[str, set[str]] = {
    "A": {"A", "B", "C", "D"},
    "B": {"B", "A", "C", "F"},
    "C": {"C", "A", "B"},
    "D": {"D", "E"},
    "E": {"E", "D"},
    "F": {"F"},
}

trusts: dict[str, set[str]] = dcp(INITIAL_TRUSTS)

# Find trusted nodes for each subject
for subject in trusts:
    # Explore all its connections
    to_explore: list[str] = list(trusts[subject])
    while to_explore:
        i = to_explore.pop(0)
        trusts[subject].add(i)
        # Explore the connections of its connections
        # Trusted items are always visited, skip...
        for j in trusts[i]:
            if j not in trusts[subject]:
                to_explore.append(j)

    trusted_list = list(trusts[subject])
    trusted_list.sort()
    print(subject, "trusts", " ".join(trusted_list))
