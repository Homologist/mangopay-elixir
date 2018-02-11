defmodule Mangopay.UboDeclaration do
  use Mangopay.Query.Base, "ubodeclarations"
  set_action "ubodeclarations", [{:get}, {:create, ["users", "ubodeclarations"]}, {:update}]
end
