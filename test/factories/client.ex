defmodule Mangopay.ClientFactory do
  defmacro __using__(_opts) do
    quote do
      def update_client_hash do
        %{
          PlatformDescription:
            "We are a marketplace specialised in rare flipflops for Europe and America. "
        }
      end

      def update_logo_client_hash do
        %{
          File:
            "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAEBAQEBAQEBAQEBAQECAgMCAgICAgQDAwIDBQQFBQUE BAQFBgcGBQUHBgQEBgkGBwgICAgIBQYJCgkICgcICAj/2wBDAQEBAQICAgQCAgQIBQQFCAgICAgI CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj/wgARCAAyADIDAREA AhEBAxEB/8QAGwAAAgMBAQEA"
        }
      end
    end
  end
end
