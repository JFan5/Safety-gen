; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 466106467 --problem-name spanner-s3-n3-l4-s466106467
(define (problem spanner-s3-n3-l4-s466106467)
 (:domain spanner)
 (:objects 
     obj_12 - type_5
     obj_08 obj_05 obj_11 - type_4
     obj_03 obj_02 obj_07 - type_2
     obj_04 obj_13 obj_06 obj_01 - type_1
     obj_10 obj_09 - type_1
    )
 (:init 
    (pred_1 obj_12 obj_10)
    (pred_1 obj_08 obj_13)
    (pred_6 obj_08)
    (pred_1 obj_05 obj_13)
    (pred_6 obj_05)
    (pred_1 obj_11 obj_06)
    (pred_6 obj_11)
    (pred_5 obj_03)
    (pred_1 obj_03 obj_09)
    (pred_5 obj_02)
    (pred_1 obj_02 obj_09)
    (pred_5 obj_07)
    (pred_1 obj_07 obj_09)
    (pred_2 obj_10 obj_04)
    (pred_2 obj_01 obj_09)
    (pred_2 obj_04 obj_13)
    (pred_2 obj_13 obj_06)
    (pred_2 obj_06 obj_01)
)
 (:goal
  (and
   (pred_4 obj_03)
   (pred_4 obj_02)
   (pred_4 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_03)) (not (pred_4 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_10)))
  )
)
)
