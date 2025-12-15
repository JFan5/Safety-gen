; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2036776367 --problem-name spanner-s3-n3-l4-s2036776367
(define (problem spanner-s3-n3-l4-s2036776367)
 (:domain spanner)
 (:objects 
     obj_08 - type_1
     obj_04 obj_01 obj_09 - type_4
     obj_11 obj_02 obj_03 - type_2
     obj_06 obj_10 obj_05 obj_12 - type_5
     obj_13 obj_07 - type_5
    )
 (:init 
    (pred_5 obj_08 obj_13)
    (pred_5 obj_04 obj_06)
    (pred_4 obj_04)
    (pred_5 obj_01 obj_06)
    (pred_4 obj_01)
    (pred_5 obj_09 obj_05)
    (pred_4 obj_09)
    (pred_6 obj_11)
    (pred_5 obj_11 obj_07)
    (pred_6 obj_02)
    (pred_5 obj_02 obj_07)
    (pred_6 obj_03)
    (pred_5 obj_03 obj_07)
    (pred_2 obj_13 obj_06)
    (pred_2 obj_12 obj_07)
    (pred_2 obj_06 obj_10)
    (pred_2 obj_10 obj_05)
    (pred_2 obj_05 obj_12)
)
 (:goal
  (and
   (pred_1 obj_11)
   (pred_1 obj_02)
   (pred_1 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_11)) (not (pred_1 obj_02))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_13)))
  )
)
)
