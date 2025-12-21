; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 586890095 --problem-name spanner-s3-n2-l4-s586890095
(define (problem spanner-s3-n2-l4-s586890095)
 (:domain spanner)
 (:objects 
     obj_06 - type_3
     obj_07 obj_02 obj_01 - type_5
     obj_09 obj_10 - type_4
     obj_11 obj_08 obj_03 obj_04 - type_2
     obj_12 obj_05 - type_2
    )
 (:init 
    (pred_2 obj_06 obj_12)
    (pred_2 obj_07 obj_04)
    (pred_1 obj_07)
    (pred_2 obj_02 obj_08)
    (pred_1 obj_02)
    (pred_2 obj_01 obj_08)
    (pred_1 obj_01)
    (pred_5 obj_09)
    (pred_2 obj_09 obj_05)
    (pred_5 obj_10)
    (pred_2 obj_10 obj_05)
    (pred_6 obj_12 obj_11)
    (pred_6 obj_04 obj_05)
    (pred_6 obj_11 obj_08)
    (pred_6 obj_08 obj_03)
    (pred_6 obj_03 obj_04)
)
 (:goal
  (and
   (pred_3 obj_09)
   (pred_3 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_09)) (not (pred_3 obj_10))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_12)))
  )
)
)
