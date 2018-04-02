defmodule Mangopay.Query.Interface do
  defmacro set_action(path, actions_list) do
    quote bind_quoted: [actions_list: actions_list] do
      actions_list |> Enum.each(fn
        {action} = {:get} -> def unquote(action)(id), do: _get(id)
                             def unquote(:"#{action}!")(id), do: _get!(id)
        {action} = {:create} -> def unquote(action)(params), do: _create(params)
                                def unquote(:"#{action}!")(params), do: _create!(params)
        {action} = {:update} -> def unquote(action)(id, params), do: _update(params, id)
                                def unquote(:"#{action}!")(id, params), do: _update!(params, id)
        {action} = {:all} -> def unquote(action)(), do: _all()
                             def unquote(:"#{action}!")(), do: _all!()
        {action, path_list} = {:get, _} -> def unquote(action)(id), do: _get(id, path_list)
                                           def unquote(:"#{action}!")(id), do: _get!(id, path_list)
        {action, path_list} = {:create, _} -> def unquote(action)(params), do: _create(params, unquote(path_list))
                                              def unquote(:"#{action}!")(params), do: _create!(params, unquote(path_list))
        {action, path_list} = {:update, _} -> def unquote(action)(id, params), do: _update(params, id, path_list)
                                              def unquote(:"#{action}!")(id, params), do: _update!(params, id, path_list)
        {action, path_list} = {:all, _} -> def unquote(action)(), do: _all(path_list)
                                           def unquote(:"#{action}!")(), do: _all!(path_list)
        _ -> nil
      end)
    end
  end
end
