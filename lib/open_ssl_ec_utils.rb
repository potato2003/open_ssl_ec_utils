module OpenSslEcUtils
  def self.to_der(key)
    if public_key?(key)
      asn1(key).to_der
    else
      key.to_der
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
