; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1159270925 --problem-name spanner-s3-n3-l4-s1159270925
(define (problem spanner-s3-n3-l4-s1159270925)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_01 obj_04 obj_06 - type_4
     obj_10 obj_02 obj_13 - type_1
     obj_09 obj_12 obj_08 obj_05 - type_2
     obj_11 obj_07 - type_2
    )
 (:init 
    (pred_3 obj_03 obj_11)
    (pred_3 obj_01 obj_08)
    (pred_6 obj_01)
    (pred_3 obj_04 obj_12)
    (pred_6 obj_04)
    (pred_3 obj_06 obj_12)
    (pred_6 obj_06)
    (pred_2 obj_10)
    (pred_3 obj_10 obj_07)
    (pred_2 obj_02)
    (pred_3 obj_02 obj_07)
    (pred_2 obj_13)
    (pred_3 obj_13 obj_07)
    (pred_1 obj_11 obj_09)
    (pred_1 obj_05 obj_07)
    (pred_1 obj_09 obj_12)
    (pred_1 obj_12 obj_08)
    (pred_1 obj_08 obj_05)
)
 (:goal
  (and
   (pred_5 obj_10)
   (pred_5 obj_02)
   (pred_5 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_02)) (not (pred_5 obj_13))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
