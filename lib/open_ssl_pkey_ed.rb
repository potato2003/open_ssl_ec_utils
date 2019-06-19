require 'openssl'

module OpenSSLPKeyED
  def self.to_der(key)
    case key
    when OpenSSL::PKey::EC::Point # EC public key
      asn1(key).to_der
    when OpenSSL::PKey::EC, OpenSSL::PKey::RSA, OpenSSL::PKey::DSA, OpenSSL::PKey::DH
      key.to_der
    end
  end

  def self.to_pem(key)
    case key
    when OpenSSL::PKey::EC::Point # EC public key
      raise "not supported OpenSSL::PKey::EC's public key yet", NotImplementedError
    when OpenSSL::PKey::EC, OpenSSL::PKey::RSA, OpenSSL::PKey::DSA, OpenSSL::PKey::DH
      key.to_pem
    end
  end

  private

  PUBLIC_KEY_ALGORITHM = 'id-ecPublicKey'

  def self.asn1(public_key)
    curve_name = public_key.group.curve_name

    asn1 = OpenSSL::ASN1::Sequence([
      OpenSSL::ASN1::Sequence([
        OpenSSL::ASN1::ObjectId(PUBLIC_KEY_ALGORITHM),
        OpenSSL::ASN1::ObjectId(curve_name)
      ]),
      OpenSSL::ASN1::BitString(
        public_key.to_octet_string(:uncompressed)
      )
    ])
  end

  def self.public_key?(key)
    key.is_a? OpenSSL::PKey::EC::Point
  end
end
