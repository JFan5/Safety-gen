; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1183080754 --problem-name spanner-s3-n3-l4-s1183080754
(define (problem spanner-s3-n3-l4-s1183080754)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_04 obj_11 obj_13 - type_4
     obj_07 obj_05 obj_08 - type_3
     obj_03 obj_10 obj_12 obj_09 - type_1
     obj_01 obj_02 - type_1
    )
 (:init 
    (pred_1 obj_06 obj_01)
    (pred_1 obj_04 obj_12)
    (pred_5 obj_04)
    (pred_1 obj_11 obj_10)
    (pred_5 obj_11)
    (pred_1 obj_13 obj_12)
    (pred_5 obj_13)
    (pred_6 obj_07)
    (pred_1 obj_07 obj_02)
    (pred_6 obj_05)
    (pred_1 obj_05 obj_02)
    (pred_6 obj_08)
    (pred_1 obj_08 obj_02)
    (pred_4 obj_01 obj_03)
    (pred_4 obj_09 obj_02)
    (pred_4 obj_03 obj_10)
    (pred_4 obj_10 obj_12)
    (pred_4 obj_12 obj_09)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_05)
   (pred_3 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_01)))
  )
)
)
