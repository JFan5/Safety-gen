; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 586890095 --problem-name spanner-s3-n2-l4-s586890095
(define (problem spanner-s3-n2-l4-s586890095)
 (:domain spanner)
 (:objects 
     obj_06 - type_2
     obj_09 obj_05 obj_08 - type_1
     obj_01 obj_10 - type_5
     obj_07 obj_02 obj_12 obj_04 - type_3
     obj_03 obj_11 - type_3
    )
 (:init 
    (pred_1 obj_06 obj_03)
    (pred_1 obj_09 obj_04)
    (pred_2 obj_09)
    (pred_1 obj_05 obj_02)
    (pred_2 obj_05)
    (pred_1 obj_08 obj_02)
    (pred_2 obj_08)
    (pred_6 obj_01)
    (pred_1 obj_01 obj_11)
    (pred_6 obj_10)
    (pred_1 obj_10 obj_11)
    (pred_3 obj_03 obj_07)
    (pred_3 obj_04 obj_11)
    (pred_3 obj_07 obj_02)
    (pred_3 obj_02 obj_12)
    (pred_3 obj_12 obj_04)
)
 (:goal
  (and
   (pred_4 obj_01)
   (pred_4 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_01)) (not (pred_4 obj_10))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_03)))
  )
)
)
