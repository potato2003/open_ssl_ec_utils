[![Gem Version](https://badge.fury.io/rb/open_ssl_pkey_ed.svg)](https://badge.fury.io/rb/open_ssl_pkey_ed)

# OpenSSLPKeyED

This gem can encode/decode OpenSSL::PKey (EC/RSA) to der/pem format

OpenSSL::PKey::EC class API is inconsistent with RSA, DSA and DH.
- refs: https://github.com/ruby/openssl/issues/29
- refs: https://github.com/ruby/openssl/issues/233

Also, OpenSSL::PKey::EC#public_key returns EC::Point class that does not has `to_der` / `to_pem`.
This gem provieds `to_der` method to solve it problem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'open_ssl_pkey_ed'
```

## Usage

encode to der format

```ruby
OpenSSLPKeyED.to_der(pubkey)
```

## TODO

- add support for EC to pem format
- add support for DSA/DH
