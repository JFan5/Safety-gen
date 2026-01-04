; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1076808626 --problem-name spanner-s3-n3-l4-s1076808626
(define (problem spanner-s3-n3-l4-s1076808626)
 (:domain spanner)
 (:objects 
     obj_13 - type_4
     obj_08 obj_11 obj_09 - type_3
     obj_05 obj_10 obj_02 - type_2
     obj_01 obj_07 obj_12 obj_06 - type_1
     obj_04 obj_03 - type_1
    )
 (:init 
    (pred_6 obj_13 obj_04)
    (pred_6 obj_08 obj_12)
    (pred_2 obj_08)
    (pred_6 obj_11 obj_06)
    (pred_2 obj_11)
    (pred_6 obj_09 obj_12)
    (pred_2 obj_09)
    (pred_3 obj_05)
    (pred_6 obj_05 obj_03)
    (pred_3 obj_10)
    (pred_6 obj_10 obj_03)
    (pred_3 obj_02)
    (pred_6 obj_02 obj_03)
    (pred_5 obj_04 obj_01)
    (pred_5 obj_06 obj_03)
    (pred_5 obj_01 obj_07)
    (pred_5 obj_07 obj_12)
    (pred_5 obj_12 obj_06)
)
 (:goal
  (and
   (pred_4 obj_05)
   (pred_4 obj_10)
   (pred_4 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_10)) (not (pred_4 obj_02))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_04)))
  )
)
)
