; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1148056202 --problem-name spanner-s3-n3-l4-s1148056202
(define (problem spanner-s3-n3-l4-s1148056202)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_08 obj_03 obj_02 - type_3
     obj_05 obj_07 obj_13 - type_5
     obj_09 obj_06 obj_10 obj_04 - type_2
     obj_12 obj_11 - type_2
    )
 (:init 
    (pred_6 obj_01 obj_12)
    (pred_6 obj_08 obj_09)
    (pred_5 obj_08)
    (pred_6 obj_03 obj_09)
    (pred_5 obj_03)
    (pred_6 obj_02 obj_09)
    (pred_5 obj_02)
    (pred_2 obj_05)
    (pred_6 obj_05 obj_11)
    (pred_2 obj_07)
    (pred_6 obj_07 obj_11)
    (pred_2 obj_13)
    (pred_6 obj_13 obj_11)
    (pred_1 obj_12 obj_09)
    (pred_1 obj_04 obj_11)
    (pred_1 obj_09 obj_06)
    (pred_1 obj_06 obj_10)
    (pred_1 obj_10 obj_04)
)
 (:goal
  (and
   (pred_4 obj_05)
   (pred_4 obj_07)
   (pred_4 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_05)) (not (pred_4 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
