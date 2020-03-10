extension Episode.Collection {
  public static let composableArchitecture = Self(
    blurb: #"""
Architecture is a tough problem and there's no shortage of articles, videos and open source projects attempting to solve the problem once and for all. In this collection we systematically develop an architecture from first principles, with an eye on building something that is composable, modular, testable, and more.
"""#,
    sections: [
      .init(
        blurb: #"""
We begin our exploration of application architecture by understanding the core problems that any architecture aims to solve, and we will explore these problems by seeing how SwiftUI approaches state management. This will lead us to formulating the 5 big problems that must be solved, and will guide the development of our architecture from this point forward:

* How to manage state across an entire application
* How to model the architecture with simple units, such as value types
* How to modularize each feature of the application
* How to model side effects in the application
* How to easily write comprehensive tests for each feature
"""#,
        coreLessons: [
          .init(episode: .ep65_swiftuiAndStateManagement_pt1),
          .init(episode: .ep66_swiftuiAndStateManagement_pt2),
          .init(episode: .ep67_swiftuiAndStateManagement_pt3),
        ],
        related: [
          .init(
            blurb: #"""
As we've seen in this section, SwiftUI is incredibly powerful and is a true paradigm shift in way of building applications. However, some things are still quite difficult to do in SwiftUI, like testing. In this episode we explore how one would test a vanilla SwiftUI application so that we can compare it to testing an application built with the composable architecture.
"""#,
            content: .episode(.ep85_testableStateManagement_thePoint)
          )
        ],
        title: "SwiftUI and State Management",
        whereToGoFromHere: #"""
Now that we understand the 5 main problems that any architecture should try to solve, and we see how SwiftUI approaches some of those problems, it's time to chart a course for ourselves. We will begin building our composable architecture from scratch by deciding on the core units that make up the architecture. We will emphasize simplicity by using value types and by making sure they support composition.
"""#
      ),
      .init(
        blurb: #"""
We begin building the composable architecture by settling on the core types that make up the architecture. We want to use value types as much as possible, because they are inherently simple, and we want the types to be composable so that we can break large problems down into small ones. We achieve both of these goals with reducers, while delegating the messy runtime of our application to a unit known as a "store."
"""#,
        coreLessons: [
          .init(episode: .ep68_composableStateManagement_reducers),
          .init(episode: .ep69_composableStateManagement_statePullbacks),
          .init(episode: .ep70_composableStateManagement_actionPullbacks),
          .init(episode: .ep71_composableStateManagement_higherOrderReducers),
        ],
        related: [
          .init(
            blurb: #"""
The composable architecture isn't the first time we've distilled the essence of some functionality into a type, and then explored its compositional properties. We did the same when we explored parsing and randomness, and we were able to cook up some impressive examples of breaking large, complex problems into very simple units.
"""#,
            content: .collections([.parsing, .randomness])
          ),
          .init(
            blurb: #"""
In this section we showed how to "pullback" reducers along key paths of state and actions. However, the pullback for actions didn't seem quite right, primarily because it required code generation to get right. It turns out that our mistake was using key paths for actions, when there is a more appropriate tool to use that we call a "case path." The following episodes introduce case paths from first principles, and then show how to refactor the composable architecture to take advantage of them.
"""#,
            content: .episodes([
              .ep87_theCaseForCasePaths_pt1,
              .ep88_theCaseForCasePaths_pt2,
              .ep89_theCaseForCasePaths_pt3,
              .ep90_composingArchitectureWithCasePaths
            ])
          )
        ],
        title: "Reducers and Stores",
        whereToGoFromHere: #"""
Although we have shown that reducers and stores are simple and composable, we haven't seen what that unlocks for us in our architecture. We will begin by showing that the composable architecture is super modular. We can break out each screen of our application into its own module, which means each screen can be built and run in complete isolation, without building any other part of the application.
"""#
      ),
      .init(
        blurb: #"""
When an architecture supports modularity it means we can put each feature in its own module so that it builds in isolation, while still allowing it to be plugged into the application as a whole. We show that the composable architecture is also very modular, and this means we can run each screen of our application as a standalone app without building the entire code base.
"""#,
        coreLessons: [
          .init(episode: .ep72_modularStateManagement_reducers),
          .init(episode: .ep73_modularStateManagement_viewState),
          .init(episode: .ep74_modularStateManagement_viewActions),
          .init(episode: .ep75_modularStateManagement_thePoint),
        ],
        related: [
          // TODO
        ],
        title: "Modularity",
        whereToGoFromHere: #"""
The toy application we have been building to explore the composable architecture is now fully modularized. But there's a very important aspect of architecture we have been ignoring: side effects. This is what allows our application to communicate with the outside world, and is the biggest source of complexity in any application. In the next section we attack this very difficult problem.
"""#
      ),
      .init(
        blurb: #"""
Side effects are by far the most complicated part of any application. They speak to the outside world, they're hard to control, and they're hard to test. Any architecture should provide a concise story for where and how to introduce them. The composable architecture makes side effects a first class citizen so that they are easily understood, all without sacrificing simplicity or composability.
"""#,
        coreLessons: [
          .init(episode: .ep76_effectfulStateManagement_synchronousEffects),
          .init(episode: .ep77_effectfulStateManagement_unidirectionalEffects),
          .init(episode: .ep78_effectfulStateManagement_asynchronousEffects),
          .init(episode: .ep79_effectfulStateManagement_thePoint),
        ],
        related: [
          .init(
            blurb: """
This section modeled side effects using a custom `Effect` type built from scratch. It turns out that any type that models asynchrony (such as reactive and promise libraries) can be used to model effects. So, we refactor the composable architecture to take advantage of Combine, Apple's reactive framework.
""",
            content: .episodes([
              .ep80_theCombineFrameworkAndEffects_pt1,
              .ep81_theCombineFrameworkAndEffects_pt2,
            ])
          )
        ],
        title: "Side Effects",
        whereToGoFromHere: #"""
The toy application we have been building to explore the composable architecture is now quite complex. We've got multiple features, each of which have been put into their own modules, and we've got side effects that are making network requests _and_ interacting with the local disk. It's probably time to write some tests right!?
"""#
      ),
      .init(
        blurb: #"""
An architecture is only as strong as its testability, and the composable architecture is incredibly testable. We are able to unit test every part of the architecture, include the core types that features are built with, the side effects that interact with the outside world, and the runtime that glues everything together to actually power the application.
"""#,
        coreLessons: [
          .init(episode: .ep82_testableStateManagement_reducers),
          .init(episode: .ep83_testableStateManagement_effects),
          .init(episode: .ep84_testableStateManagement_ergonomics),
          .init(episode: .ep85_testableStateManagement_thePoint),
        ],
        related: [
          .init(
            blurb: #"""
The composable architecture also unlocks some incredibly ways to perform snapshot testing in SwiftUI. We are able to use the store to play a series of user actions, and then take snapshots of the UI at each step of the way. This gives us lightweight integration testing of our UI with very little work that rivals the tools that Xcode gives us out of the box.
"""#,
            content: .episode(.ep86_swiftUiSnapshotTesting)
          ),
          .init(
            blurb: #"""
In this section we used the "environment" technique for controlling dependencies that we first covered in the early days of Point-Free. It eschews using protocols for dependencies and just uses simple structs, which gives us a lot of flexibility.
"""#,
            content: .episodes([
              .ep16_dependencyInjectionMadeEasy,
              .ep18_dependencyInjectionMadeComfortable
            ])
          ),
          .init(
            blurb: #"""
Although the "environment" technique of dependency injection is powerful, and can help you get test coverage in an application almost immediately, we can make it even better in the composable architecture. By baking the notion of an environment directly into the core types of the architecture we will make our dependencies more controllable and more understandable, all without sacrificing composability.
"""#,
            content: .episodes([
              .ep91_modularDependencyInjection_pt1,
              .ep92_modularDependencyInjection_pt2,
              .ep93_modularDependencyInjection_pt3
            ]))
        ],
        title: "Testing",
        whereToGoFromHere: nil
      ),
    ],
    title: "Composable Architecture"
  )
}
