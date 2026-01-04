; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2145691077 --problem-name spanner-s3-n3-l4-s2145691077
(define (problem spanner-s3-n3-l4-s2145691077)
 (:domain spanner)
 (:objects 
     obj_13 - type_1
     obj_07 obj_04 obj_08 - type_2
     obj_06 obj_12 obj_10 - type_4
     obj_05 obj_01 obj_03 obj_09 - type_5
     obj_11 obj_02 - type_5
    )
 (:init 
    (pred_3 obj_13 obj_11)
    (pred_3 obj_07 obj_03)
    (pred_2 obj_07)
    (pred_3 obj_04 obj_05)
    (pred_2 obj_04)
    (pred_3 obj_08 obj_01)
    (pred_2 obj_08)
    (pred_6 obj_06)
    (pred_3 obj_06 obj_02)
    (pred_6 obj_12)
    (pred_3 obj_12 obj_02)
    (pred_6 obj_10)
    (pred_3 obj_10 obj_02)
    (pred_5 obj_11 obj_05)
    (pred_5 obj_09 obj_02)
    (pred_5 obj_05 obj_01)
    (pred_5 obj_01 obj_03)
    (pred_5 obj_03 obj_09)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_12)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_12)) (not (pred_1 obj_10))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
