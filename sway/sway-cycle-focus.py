import sys
import i3ipc

i3 = i3ipc.Connection()
tree = i3.get_tree()
curr = tree.find_focused()
leaves = [x.id for x in tree.find_focused().workspace().leaves()]
if not len(leaves):
    sys.exit(0)
idx = leaves.index(curr.id)

print(idx)
if sys.argv[1:] and sys.argv[1] == '-1':
    idx -= 1
else:
    idx += 1
    idx %= len(leaves)

print(idx)
window = leaves[idx]
i3.command('[con_id=%s] focus' % leaves[idx])
#print(dir(curr))
