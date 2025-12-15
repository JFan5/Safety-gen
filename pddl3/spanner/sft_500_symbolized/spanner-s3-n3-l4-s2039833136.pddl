; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2039833136 --problem-name spanner-s3-n3-l4-s2039833136
(define (problem spanner-s3-n3-l4-s2039833136)
 (:domain spanner)
 (:objects 
     obj_10 - type_2
     obj_12 obj_04 obj_02 - type_4
     obj_09 obj_03 obj_05 - type_5
     obj_01 obj_08 obj_13 obj_06 - type_3
     obj_11 obj_07 - type_3
    )
 (:init 
    (pred_1 obj_10 obj_11)
    (pred_1 obj_12 obj_13)
    (pred_6 obj_12)
    (pred_1 obj_04 obj_13)
    (pred_6 obj_04)
    (pred_1 obj_02 obj_13)
    (pred_6 obj_02)
    (pred_2 obj_09)
    (pred_1 obj_09 obj_07)
    (pred_2 obj_03)
    (pred_1 obj_03 obj_07)
    (pred_2 obj_05)
    (pred_1 obj_05 obj_07)
    (pred_4 obj_11 obj_01)
    (pred_4 obj_06 obj_07)
    (pred_4 obj_01 obj_08)
    (pred_4 obj_08 obj_13)
    (pred_4 obj_13 obj_06)
)
 (:goal
  (and
   (pred_3 obj_09)
   (pred_3 obj_03)
   (pred_3 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_03)) (not (pred_3 obj_05))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_11)))
  )
)
)
