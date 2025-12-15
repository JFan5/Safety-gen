; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 247445534 --problem-name spanner-s2-n2-l3-s247445534
(define (problem spanner-s2-n2-l3-s247445534)
 (:domain spanner)
 (:objects 
     obj_03 - type_2
     obj_05 obj_09 - type_1
     obj_02 obj_10 - type_3
     obj_07 obj_08 obj_01 - type_4
     obj_04 obj_06 - type_4
    )
 (:init 
    (pred_6 obj_03 obj_04)
    (pred_6 obj_05 obj_08)
    (pred_5 obj_05)
    (pred_6 obj_09 obj_07)
    (pred_5 obj_09)
    (pred_3 obj_02)
    (pred_6 obj_02 obj_06)
    (pred_3 obj_10)
    (pred_6 obj_10 obj_06)
    (pred_4 obj_04 obj_07)
    (pred_4 obj_01 obj_06)
    (pred_4 obj_07 obj_08)
    (pred_4 obj_08 obj_01)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_10))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_04)))
  )
)
)
