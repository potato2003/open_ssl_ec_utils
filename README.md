# OpenSslEcUtils

This can generate a der-encoded public key.

OpenSSL::PKey::EC class API is inconsistent with RSA, DSA and DH.
- refs: https://github.com/ruby/openssl/issues/29
- refs: https://github.com/ruby/openssl/issues/233

Also, OpenSSL::PKey::EC#public_key returns EC::Point class that does not has `to_der` / `to_pem`.
This gem provieds `to_der` method to solve it problem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'open_ssl_ec_utils'
```

## Usage

encode to der format

```ruby
OpenSslEcUtils.to_der(pubkey)
```
