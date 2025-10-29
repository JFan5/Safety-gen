(define (problem BW-rand-3_constrained)
  (:domain blocksworld)
  (:objects
    b1 b2 b3 - block
  )
  (:requirements :strips :typing :constraints :preferences)
  (:init
    (on b1 b2)
    (on-table b2)
    (on-table b3)
    (clear b1)
    (clear b3)
  )
  (:goal
    (and
(on b1 b2)
(on b2 b3
  )
  (:constraints
    (and
      (always (forall (?x - block) (imply (holding ?x) (not (handempty)))))
      (always (forall (?x - block) (imply (holding ?x) (not (clear ?x)))))
      (always (forall (?x ?y - block) (imply (on ?x ?y) (not (clear ?y)))))
      (sometime (holding b1))
      (always (imply (on b1 b2) (until (on b1 b2) (and (on b1 b2) (goal)))))
      (sometime (clear a))
      (at-end (handempty))
    )
  )
  (:metric minimize (total-time))
)