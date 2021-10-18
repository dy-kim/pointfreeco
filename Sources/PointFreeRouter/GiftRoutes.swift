import ApplicativeRouter
import Models
import Prelude
import Stripe
import TaggedMoney

public enum Gifts: Equatable {
  case create(GiftFormData)
  case index
  case plan(Plan)
  case redeem(Coupon.Id)
  case redeemLanding(Coupon.Id)

  public enum Plan: String {
    case threeMonths
    case sixMonths
    case year

    public init?(monthCount: Int) {
      switch monthCount {
      case 3:  self = .threeMonths
      case 6:  self = .sixMonths
      case 12: self = .year
      default: return nil
      }
    }

    public var amount: Cents<Int> {
      switch self {
      case .threeMonths:
        return 54_00
      case .sixMonths:
        return 108_00
      case .year:
        return 168_00
      }
    }

    public var monthCount: Int {
      switch self {
      case .threeMonths:
        return 3
      case .sixMonths:
        return 6
      case .year:
        return 12
      }
    }
  }
}

let giftsRouter = giftsRouters.reduce(.empty, <|>)

private let giftsRouters: [Router<Gifts>] = [
  .case(Gifts.create)
    <¢> post
    %> jsonBody(GiftFormData.self, encoder: routeJsonEncoder, decoder: routeJsonDecoder) <% end,

  .case(.index)
    <¢> get <% end,

  .case(Gifts.plan)
    <¢> get %> pathParam(.rawRepresentable) <% end,

  .case(Gifts.redeem)
    <¢> get %> pathParam(.tagged) <% end,

  .case(Gifts.redeemLanding)
    <¢> post %> pathParam(.tagged) <% end,
]
