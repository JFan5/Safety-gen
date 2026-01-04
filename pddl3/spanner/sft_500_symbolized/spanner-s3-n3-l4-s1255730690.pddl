; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1255730690 --problem-name spanner-s3-n3-l4-s1255730690
(define (problem spanner-s3-n3-l4-s1255730690)
 (:domain spanner)
 (:objects 
     obj_03 - type_4
     obj_13 obj_09 obj_02 - type_3
     obj_04 obj_05 obj_08 - type_5
     obj_06 obj_12 obj_07 obj_10 - type_2
     obj_01 obj_11 - type_2
    )
 (:init 
    (pred_1 obj_03 obj_01)
    (pred_1 obj_13 obj_07)
    (pred_5 obj_13)
    (pred_1 obj_09 obj_07)
    (pred_5 obj_09)
    (pred_1 obj_02 obj_12)
    (pred_5 obj_02)
    (pred_3 obj_04)
    (pred_1 obj_04 obj_11)
    (pred_3 obj_05)
    (pred_1 obj_05 obj_11)
    (pred_3 obj_08)
    (pred_1 obj_08 obj_11)
    (pred_6 obj_01 obj_06)
    (pred_6 obj_10 obj_11)
    (pred_6 obj_06 obj_12)
    (pred_6 obj_12 obj_07)
    (pred_6 obj_07 obj_10)
)
 (:goal
  (and
   (pred_2 obj_04)
   (pred_2 obj_05)
   (pred_2 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_05)) (not (pred_2 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_01)))
  )
)
)
