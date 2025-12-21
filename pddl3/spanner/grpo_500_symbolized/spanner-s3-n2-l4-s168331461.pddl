; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 168331461 --problem-name spanner-s3-n2-l4-s168331461
(define (problem spanner-s3-n2-l4-s168331461)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_04 obj_02 obj_05 - type_3
     obj_09 obj_01 - type_1
     obj_10 obj_08 obj_06 obj_03 - type_2
     obj_12 obj_11 - type_2
    )
 (:init 
    (pred_6 obj_07 obj_12)
    (pred_6 obj_04 obj_08)
    (pred_5 obj_04)
    (pred_6 obj_02 obj_06)
    (pred_5 obj_02)
    (pred_6 obj_05 obj_10)
    (pred_5 obj_05)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_11)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_11)
    (pred_3 obj_12 obj_10)
    (pred_3 obj_03 obj_11)
    (pred_3 obj_10 obj_08)
    (pred_3 obj_08 obj_06)
    (pred_3 obj_06 obj_03)
)
 (:goal
  (and
   (pred_1 obj_09)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_09)) (not (pred_1 obj_01))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
