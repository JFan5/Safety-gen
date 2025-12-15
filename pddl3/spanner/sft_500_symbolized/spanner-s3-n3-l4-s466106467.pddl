; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 466106467 --problem-name spanner-s3-n3-l4-s466106467
(define (problem spanner-s3-n3-l4-s466106467)
 (:domain spanner)
 (:objects 
     obj_07 - type_4
     obj_01 obj_11 obj_03 - type_5
     obj_05 obj_10 obj_12 - type_2
     obj_09 obj_13 obj_04 obj_02 - type_1
     obj_08 obj_06 - type_1
    )
 (:init 
    (pred_4 obj_07 obj_08)
    (pred_4 obj_01 obj_13)
    (pred_6 obj_01)
    (pred_4 obj_11 obj_13)
    (pred_6 obj_11)
    (pred_4 obj_03 obj_04)
    (pred_6 obj_03)
    (pred_2 obj_05)
    (pred_4 obj_05 obj_06)
    (pred_2 obj_10)
    (pred_4 obj_10 obj_06)
    (pred_2 obj_12)
    (pred_4 obj_12 obj_06)
    (pred_5 obj_08 obj_09)
    (pred_5 obj_02 obj_06)
    (pred_5 obj_09 obj_13)
    (pred_5 obj_13 obj_04)
    (pred_5 obj_04 obj_02)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_10)
   (pred_3 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_10))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_08)))
  )
)
)
