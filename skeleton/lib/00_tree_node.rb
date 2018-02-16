require 'byebug'

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

  def dfs(target_value)
    return self if value == target_value
    return nil if self.children.empty?
    stack = []
    stack.concat(self.children.reverse)

    until stack.empty?
      child = stack.pop
      result = child.dfs(target_value)
      return result unless result.nil?
    end
  end

  def bfs(target_value)
    queue = []
    queue << self

    until queue.empty?
      cur = queue.shift
      if cur.value == target_value
        return cur
      end

      queue += cur.children
    end
  end
end
