; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1883059892 --problem-name spanner-s3-n3-l4-s1883059892
(define (problem spanner-s3-n3-l4-s1883059892)
 (:domain spanner)
 (:objects 
     obj_11 - type_3
     obj_04 obj_01 obj_09 - type_2
     obj_13 obj_12 obj_03 - type_1
     obj_05 obj_10 obj_08 obj_07 - type_4
     obj_06 obj_02 - type_4
    )
 (:init 
    (pred_1 obj_11 obj_06)
    (pred_1 obj_04 obj_05)
    (pred_4 obj_04)
    (pred_1 obj_01 obj_07)
    (pred_4 obj_01)
    (pred_1 obj_09 obj_10)
    (pred_4 obj_09)
    (pred_5 obj_13)
    (pred_1 obj_13 obj_02)
    (pred_5 obj_12)
    (pred_1 obj_12 obj_02)
    (pred_5 obj_03)
    (pred_1 obj_03 obj_02)
    (pred_6 obj_06 obj_05)
    (pred_6 obj_07 obj_02)
    (pred_6 obj_05 obj_10)
    (pred_6 obj_10 obj_08)
    (pred_6 obj_08 obj_07)
)
 (:goal
  (and
   (pred_2 obj_13)
   (pred_2 obj_12)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_13)) (not (pred_2 obj_12))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_06)))
  )
)
)
