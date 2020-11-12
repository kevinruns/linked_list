

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    @head_new = Node.new(value, nil)
    @head.next_node = @head_new.dup unless @head.nil?
    @tail = @head.dup if @tail.nil? || @tail.next_node.nil?
    p "append #{@head.value}"
    p "link #{@head.next_node}"
    @head = @head_new.dup
  end

  def prepend(value)
    @tail = Node.new(value,@tail)
    @head = @tail.dup if @head.nil?
  end

  def size

    node_index = @tail.dup

    p node_index.value
    node2 = node_index.next_node.dup
    p node_index.next_node.value
    p node2.value

    p @head.value


    # i = @tail.value ? 1 : 0
    # node_index = @tail.dup

    # until node_index.value.nil?
    #   p node_index.value
    #   p i
    #   i += 1
    #   node_index = node_index.next_node.dup
    # end
    # i
  end
end


class Node
  attr_accessor :next_node
  attr_reader :value

  def initialize(value, next_node)
    @value = value
    @next_node = next_node.dup
  end
end

list = LinkedList.new
list.append(5)
list.append(6)
list.append(7)
list.size