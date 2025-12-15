; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 985173188 --problem-name spanner-s3-n3-l4-s985173188
(define (problem spanner-s3-n3-l4-s985173188)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_05 obj_09 obj_07 - type_5
     obj_08 obj_03 obj_02 - type_1
     obj_12 obj_04 obj_13 obj_11 - type_3
     obj_01 obj_06 - type_3
    )
 (:init 
    (pred_3 obj_10 obj_01)
    (pred_3 obj_05 obj_13)
    (pred_1 obj_05)
    (pred_3 obj_09 obj_13)
    (pred_1 obj_09)
    (pred_3 obj_07 obj_04)
    (pred_1 obj_07)
    (pred_5 obj_08)
    (pred_3 obj_08 obj_06)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_06)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_06)
    (pred_4 obj_01 obj_12)
    (pred_4 obj_11 obj_06)
    (pred_4 obj_12 obj_04)
    (pred_4 obj_04 obj_13)
    (pred_4 obj_13 obj_11)
)
 (:goal
  (and
   (pred_2 obj_08)
   (pred_2 obj_03)
   (pred_2 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_02))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_01)))
  )
)
)
