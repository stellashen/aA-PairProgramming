class PolyTreeNode
  def initialize(value, parent = nil, children = [])
    @value = value
    @parent = parent
    @children = children
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    self.parent.children.delete(self) unless self.parent.nil?
    @parent = node
    node.children << self unless parent.nil? || node.children.include?(self)
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    raise "Node is not a child" unless self.children.include?(child_node)
    child_node.parent=(nil)
  end
end
