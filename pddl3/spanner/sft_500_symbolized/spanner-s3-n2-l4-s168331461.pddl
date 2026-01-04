; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 168331461 --problem-name spanner-s3-n2-l4-s168331461
(define (problem spanner-s3-n2-l4-s168331461)
 (:domain spanner)
 (:objects 
     obj_04 - type_4
     obj_09 obj_02 obj_06 - type_2
     obj_05 obj_07 - type_1
     obj_03 obj_01 obj_11 obj_12 - type_3
     obj_10 obj_08 - type_3
    )
 (:init 
    (pred_5 obj_04 obj_10)
    (pred_5 obj_09 obj_01)
    (pred_4 obj_09)
    (pred_5 obj_02 obj_11)
    (pred_4 obj_02)
    (pred_5 obj_06 obj_03)
    (pred_4 obj_06)
    (pred_1 obj_05)
    (pred_5 obj_05 obj_08)
    (pred_1 obj_07)
    (pred_5 obj_07 obj_08)
    (pred_6 obj_10 obj_03)
    (pred_6 obj_12 obj_08)
    (pred_6 obj_03 obj_01)
    (pred_6 obj_01 obj_11)
    (pred_6 obj_11 obj_12)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_5 ?m obj_10)))
  )
)
)
