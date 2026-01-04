; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2039833136 --problem-name spanner-s3-n3-l4-s2039833136
(define (problem spanner-s3-n3-l4-s2039833136)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_06 obj_09 obj_10 - type_1
     obj_02 obj_04 obj_05 - type_3
     obj_11 obj_08 obj_03 obj_01 - type_2
     obj_12 obj_13 - type_2
    )
 (:init 
    (pred_6 obj_07 obj_12)
    (pred_6 obj_06 obj_03)
    (pred_1 obj_06)
    (pred_6 obj_09 obj_03)
    (pred_1 obj_09)
    (pred_6 obj_10 obj_03)
    (pred_1 obj_10)
    (pred_5 obj_02)
    (pred_6 obj_02 obj_13)
    (pred_5 obj_04)
    (pred_6 obj_04 obj_13)
    (pred_5 obj_05)
    (pred_6 obj_05 obj_13)
    (pred_4 obj_12 obj_11)
    (pred_4 obj_01 obj_13)
    (pred_4 obj_11 obj_08)
    (pred_4 obj_08 obj_03)
    (pred_4 obj_03 obj_01)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_04)
   (pred_2 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_04)) (not (pred_2 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
