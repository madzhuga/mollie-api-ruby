module Mollie
  class Customer
    class Mandate < Base
      STATUS_VALID   = "valid"
      STATUS_INVALID = "invalid"
      STATUS_PENDING = "pending"

      attr_accessor :id,
                    :status,
                    :method,
                    :customer_id,
                    :details,
                    :mandate_reference,
                    :signature_date,
                    :created_at

      def details=(details)
        @details = OpenStruct.new(details) if details.is_a?(Hash)
      end

      def created_at=(created_at)
        @created_at = Time.parse(created_at.to_s) rescue nil
      end

      def valid?
        status == STATUS_VALID
      end

      def pending?
        status == STATUS_PENDING
      end

      def invalid?
        status == STATUS_INVALID
      end
    end
  end
end
