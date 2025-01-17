import EmailAddress
import Foundation
import Stripe
import Tagged

public struct Gift: Decodable {
  public var deliverAt: Date?
  public var delivered: Bool
  public var fromEmail: EmailAddress
  public var fromName: String
  public var id: Id
  public var message: String
  public var monthsFree: Int
  public var stripePaymentIntentId: PaymentIntent.Id
  public var stripePaymentIntentStatus: PaymentIntent.Status
  public var stripeSubscriptionId: Stripe.Subscription.Id?
  public var toEmail: EmailAddress
  public var toName: String

  public init(
    deliverAt: Date?,
    delivered: Bool,
    fromEmail: EmailAddress,
    fromName: String,
    id: Id,
    message: String,
    monthsFree: Int,
    stripePaymentIntentId: PaymentIntent.Id,
    stripePaymentIntentStatus: PaymentIntent.Status,
    stripeSubscriptionId: Stripe.Subscription.Id?,
    toEmail: EmailAddress,
    toName: String
  ) {
    self.deliverAt = deliverAt
    self.delivered = delivered
    self.fromEmail = fromEmail
    self.fromName = fromName
    self.id = id
    self.message = message
    self.monthsFree = monthsFree
    self.stripePaymentIntentId = stripePaymentIntentId
    self.stripePaymentIntentStatus = stripePaymentIntentStatus
    self.stripeSubscriptionId = stripeSubscriptionId
    self.toEmail = toEmail
    self.toName = toName
  }

  public typealias Id = Tagged<Self, UUID>
}
