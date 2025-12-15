; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1081540764 --problem-name spanner-s3-n3-l4-s1081540764
(define (problem spanner-s3-n3-l4-s1081540764)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_12 obj_09 obj_04 - type_1
     obj_01 obj_02 obj_13 - type_4
     obj_08 obj_06 obj_03 obj_10 - type_2
     obj_11 obj_07 - type_2
    )
 (:init 
    (pred_3 obj_05 obj_11)
    (pred_3 obj_12 obj_06)
    (pred_6 obj_12)
    (pred_3 obj_09 obj_03)
    (pred_6 obj_09)
    (pred_3 obj_04 obj_03)
    (pred_6 obj_04)
    (pred_5 obj_01)
    (pred_3 obj_01 obj_07)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_07)
    (pred_5 obj_13)
    (pred_3 obj_13 obj_07)
    (pred_2 obj_11 obj_08)
    (pred_2 obj_10 obj_07)
    (pred_2 obj_08 obj_06)
    (pred_2 obj_06 obj_03)
    (pred_2 obj_03 obj_10)
)
 (:goal
  (and
   (pred_1 obj_01)
   (pred_1 obj_02)
   (pred_1 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_01)) (not (pred_1 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
