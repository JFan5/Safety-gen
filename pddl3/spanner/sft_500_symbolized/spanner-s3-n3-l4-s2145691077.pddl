; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2145691077 --problem-name spanner-s3-n3-l4-s2145691077
(define (problem spanner-s3-n3-l4-s2145691077)
 (:domain spanner)
 (:objects 
     obj_04 - type_3
     obj_06 obj_11 obj_13 - type_4
     obj_12 obj_10 obj_03 - type_2
     obj_07 obj_05 obj_01 obj_08 - type_1
     obj_02 obj_09 - type_1
    )
 (:init 
    (pred_1 obj_04 obj_02)
    (pred_1 obj_06 obj_01)
    (pred_3 obj_06)
    (pred_1 obj_11 obj_07)
    (pred_3 obj_11)
    (pred_1 obj_13 obj_05)
    (pred_3 obj_13)
    (pred_4 obj_12)
    (pred_1 obj_12 obj_09)
    (pred_4 obj_10)
    (pred_1 obj_10 obj_09)
    (pred_4 obj_03)
    (pred_1 obj_03 obj_09)
    (pred_6 obj_02 obj_07)
    (pred_6 obj_08 obj_09)
    (pred_6 obj_07 obj_05)
    (pred_6 obj_05 obj_01)
    (pred_6 obj_01 obj_08)
)
 (:goal
  (and
   (pred_2 obj_12)
   (pred_2 obj_10)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_10)) (not (pred_2 obj_03))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_02)))
  )
)
)
