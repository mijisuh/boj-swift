typealias Child = (left: String, right: String)

func preorder(_ node: String) { // node -> left -> right
    if node == "." { return }
    print(node, terminator: "")
    preorder(tree[node]!.left)
    preorder(tree[node]!.right)
}

func inorder(_ node: String) { // left -> node -> right
    if node == "." { return }
    inorder(tree[node]!.left)
    print(node, terminator: "")
    inorder(tree[node]!.right)
}

func postorder(_ node: String) { // left -> right -> node
    if node == "." { return }
    postorder(tree[node]!.left)
    postorder(tree[node]!.right)
    print(node, terminator: "")
}

let n = Int(readLine() ?? "") ?? 0
var tree: [String: Child] = [:]
while let input = readLine() {
    let inputs = input.split { $0 == " " }.map { String($0) }
    let (node, left, right) = (inputs[0], inputs[1], inputs[2])
    tree[node] = Child(left, right)
}

preorder("A")
print()
inorder("A")
print()
postorder("A")
