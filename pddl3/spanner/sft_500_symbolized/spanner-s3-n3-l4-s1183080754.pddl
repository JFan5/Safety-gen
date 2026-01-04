; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1183080754 --problem-name spanner-s3-n3-l4-s1183080754
(define (problem spanner-s3-n3-l4-s1183080754)
 (:domain spanner)
 (:objects 
     obj_09 - type_1
     obj_10 obj_13 obj_05 - type_5
     obj_11 obj_07 obj_03 - type_3
     obj_06 obj_01 obj_04 obj_12 - type_4
     obj_08 obj_02 - type_4
    )
 (:init 
    (pred_3 obj_09 obj_08)
    (pred_3 obj_10 obj_04)
    (pred_4 obj_10)
    (pred_3 obj_13 obj_01)
    (pred_4 obj_13)
    (pred_3 obj_05 obj_04)
    (pred_4 obj_05)
    (pred_6 obj_11)
    (pred_3 obj_11 obj_02)
    (pred_6 obj_07)
    (pred_3 obj_07 obj_02)
    (pred_6 obj_03)
    (pred_3 obj_03 obj_02)
    (pred_2 obj_08 obj_06)
    (pred_2 obj_12 obj_02)
    (pred_2 obj_06 obj_01)
    (pred_2 obj_01 obj_04)
    (pred_2 obj_04 obj_12)
)
 (:goal
  (and
   (pred_5 obj_11)
   (pred_5 obj_07)
   (pred_5 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_07)) (not (pred_5 obj_03))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_08)))
  )
)
)
