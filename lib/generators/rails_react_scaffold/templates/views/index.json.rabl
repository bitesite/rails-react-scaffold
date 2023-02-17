collection @<%= plural_name %>
<% viewable_attributes.each_with_index do |attribute, index| %><% if index == 0 %>
attributes :<%= attribute.name %>,<% elsif index == (viewable_attributes.size - 1) %>           :<%= attribute.name %><% else %>           :<%= attribute.name %>,<% end %>
<% end %>