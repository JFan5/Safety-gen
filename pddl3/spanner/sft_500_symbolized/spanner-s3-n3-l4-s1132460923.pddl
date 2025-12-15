; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1132460923 --problem-name spanner-s3-n3-l4-s1132460923
(define (problem spanner-s3-n3-l4-s1132460923)
 (:domain spanner)
 (:objects 
     obj_13 - type_2
     obj_08 obj_05 obj_06 - type_3
     obj_02 obj_03 obj_04 - type_1
     obj_12 obj_09 obj_10 obj_01 - type_5
     obj_11 obj_07 - type_5
    )
 (:init 
    (pred_2 obj_13 obj_11)
    (pred_2 obj_08 obj_10)
    (pred_1 obj_08)
    (pred_2 obj_05 obj_09)
    (pred_1 obj_05)
    (pred_2 obj_06 obj_12)
    (pred_1 obj_06)
    (pred_6 obj_02)
    (pred_2 obj_02 obj_07)
    (pred_6 obj_03)
    (pred_2 obj_03 obj_07)
    (pred_6 obj_04)
    (pred_2 obj_04 obj_07)
    (pred_3 obj_11 obj_12)
    (pred_3 obj_01 obj_07)
    (pred_3 obj_12 obj_09)
    (pred_3 obj_09 obj_10)
    (pred_3 obj_10 obj_01)
)
 (:goal
  (and
   (pred_4 obj_02)
   (pred_4 obj_03)
   (pred_4 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_03)) (not (pred_4 obj_04))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_11)))
  )
)
)
