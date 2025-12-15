; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 488235187 --problem-name spanner-s3-n2-l4-s488235187
(define (problem spanner-s3-n2-l4-s488235187)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_10 obj_12 obj_03 - type_3
     obj_11 obj_08 - type_4
     obj_07 obj_04 obj_05 obj_02 - type_2
     obj_01 obj_09 - type_2
    )
 (:init 
    (pred_2 obj_06 obj_01)
    (pred_2 obj_10 obj_05)
    (pred_1 obj_10)
    (pred_2 obj_12 obj_07)
    (pred_1 obj_12)
    (pred_2 obj_03 obj_05)
    (pred_1 obj_03)
    (pred_4 obj_11)
    (pred_2 obj_11 obj_09)
    (pred_4 obj_08)
    (pred_2 obj_08 obj_09)
    (pred_5 obj_01 obj_07)
    (pred_5 obj_02 obj_09)
    (pred_5 obj_07 obj_04)
    (pred_5 obj_04 obj_05)
    (pred_5 obj_05 obj_02)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_11)) (not (pred_3 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_01)))
  )
)
)
