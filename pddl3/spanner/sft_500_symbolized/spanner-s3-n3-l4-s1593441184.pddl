; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1593441184 --problem-name spanner-s3-n3-l4-s1593441184
(define (problem spanner-s3-n3-l4-s1593441184)
 (:domain spanner)
 (:objects 
     obj_03 - type_2
     obj_06 obj_04 obj_13 - type_1
     obj_02 obj_09 obj_05 - type_3
     obj_10 obj_08 obj_07 obj_01 - type_4
     obj_12 obj_11 - type_4
    )
 (:init 
    (pred_1 obj_03 obj_12)
    (pred_1 obj_06 obj_10)
    (pred_3 obj_06)
    (pred_1 obj_04 obj_07)
    (pred_3 obj_04)
    (pred_1 obj_13 obj_07)
    (pred_3 obj_13)
    (pred_2 obj_02)
    (pred_1 obj_02 obj_11)
    (pred_2 obj_09)
    (pred_1 obj_09 obj_11)
    (pred_2 obj_05)
    (pred_1 obj_05 obj_11)
    (pred_6 obj_12 obj_10)
    (pred_6 obj_01 obj_11)
    (pred_6 obj_10 obj_08)
    (pred_6 obj_08 obj_07)
    (pred_6 obj_07 obj_01)
)
 (:goal
  (and
   (pred_5 obj_02)
   (pred_5 obj_09)
   (pred_5 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_02)) (not (pred_5 obj_09))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_12)))
  )
)
)
