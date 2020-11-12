# linked list
class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    @head_new = Node.new(value, nil)
    @head.next_node = @head_new unless @head.nil?
    @tail = @head if @tail.nil?
    @head = @head_new
  end

  def prepend(value)
    @tail = Node.new(value, @tail)
    @head = @tail if @head.nil?
  end

  def size
    return 0 if @tail.nil?

    node_index = @tail
    list_size = 1

    until node_index.next_node.nil?
      list_size += 1
      node_index = node_index.next_node
    end
    list_size
  end

  def at(index)
    return "Error no list" if @tail.nil?

    node_index = @tail
    list_index = 0

    until index == list_index
      return "Error index beyond list size" if node_index.next_node.nil?

      node_index = node_index.next_node
      list_index += 1
    end
    node_index
  end

  def pop
    return 0 if @tail.nil?

    node_index = @tail

    until node_index.next_node.nil?
      node_prev = node_index
      node_index = node_index.next_node
    end

    @head = node_prev
    @head.next_node = nil
  end

  def contains?(value)
    return false if @tail.nil?

    node_index = @tail

    until node_index.next_node.nil?
      return true if node_index.value == value

      node_index = node_index.next_node
    end
    node_index.value == value
  end

  def find(value)
    return "Error no list" if @tail.nil?

    node_index = @tail
    i = 0
    until node_index.next_node.nil?
      return i if node_index.value == value

      node_index = node_index.next_node
      i += 1
    end
    node_index.value == value ? i : "Not found"
  end

  def to_s
    return "Error no list" if @tail.nil?

    node_index = @tail
    until node_index.next_node.nil?
      print "( #{node_index.value} ) -> "
      node_index = node_index.next_node
    end
    print "( #{node_index.value} ) -> nil \n"
  end

  def insert_at(value, index)
    return "Error no list" if @tail.nil?

    node_index = @tail
    if index == 0
      new_node = Node.new(value, node_index.next_node)
      @tail = new_node
    else
      i = 0
      until node_index.next_node.nil?
        if index == i + 1
          new_node = Node.new(value, node_index.next_node)
          node_index.next_node = new_node
        end
        node_index = node_index.next_node
        i += 1
      end
      "ERROR index too big"
    end
  end

  def remove_at(index)
    return "Error no list" if @tail.nil?

    node_index = @tail

    if index == 0
      @tail = node_index.next_node
    else
      i = 1
      until node_index.next_node.nil?
        node_index.next_node = node_index.next_node.next_node if index == i
        node_index = node_index.next_node
        i += 1
      end
      "ERROR index too big"
    end
  end
end

# node class
class Node
  attr_accessor :next_node
  attr_reader :value

  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
list.append(5)
list.append(1)
list.append(2)
list.append(6)
list.append(7)

list.to_s
list.insert_at(12, 2)
list.to_s
list.insert_at(14, 4)
list.to_s
list.remove_at(3)
list.to_s
list.remove_at(2)
list.to_s
list.remove_at(0)
list.to_s
