struct Node {
	int value;
	Node *next;

	Node(int v, Node *n): value(v), next(n) {} 
};

struct LinkedList {
	Node *head;

	LinkedList(): head(nullptr) {}

	void append(int v) {
		head = new Node(v, head);
	}

	void print() {
		Node *curr = head;
		while (curr != nullptr) {
			std::cout << curr->value << " ";
			curr = curr->next;
		}
		std::cout << std::endl;
	}
};