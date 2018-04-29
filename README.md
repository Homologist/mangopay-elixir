# [![CircleCI](https://circleci.com/gh/Homologist/mangopay-elixir.svg?style=shield)](https://circleci.com/gh/Homologist/mangopay-elixir) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/circleci/circleci-docs/master/LICENSE) [![Coverage Status](https://coveralls.io/repos/github/Homologist/mangopay-elixir/badge.svg?branch=master)](https://coveralls.io/github/Homologist/mangopay-elixir?branch=master) [![Inline docs](http://inch-ci.org/github/Homologist/mangopay-elixir.svg?branch=master)](http://inch-ci.org/github/Homologist/mangopay-elixir) 
# MangoPay

**TODO: Add description**

## Installation

An Elixir library for MangoPay [MangoPay](https://mangopay.com/).

The package can be installed by adding `mangopay` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mangopay, "~> 0.1.0"}
  ]
end
```

## Usage

Install the dependency:

```ex
{:mangopay, "~> 0.1.0"}
```

Next, add to your applications:

```ex
defp application do
  [applications: [:mangopay]]
end
```

## Configuration

To call mangopay your needs your client id and passphrase.

```ex
use Mix.Config

config :mangopay, client_id: "YOUR CONNECT CLIENT ID"
config :mangoapy, passphrase: "YOUR KEY"
```

## The API
The full documentation of the API is avaiable

## Contributing

Feedback, feature requests are welcome.


## License

Please see [LICENSE](LICENSE) for licensing details.
