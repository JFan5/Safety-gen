; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 443573013 --problem-name spanner-s3-n3-l4-s443573013
(define (problem spanner-s3-n3-l4-s443573013)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_10 obj_09 obj_08 - type_5
     obj_02 obj_12 obj_06 - type_1
     obj_03 obj_01 obj_04 obj_05 - type_4
     obj_11 obj_13 - type_4
    )
 (:init 
    (pred_6 obj_07 obj_11)
    (pred_6 obj_10 obj_01)
    (pred_5 obj_10)
    (pred_6 obj_09 obj_05)
    (pred_5 obj_09)
    (pred_6 obj_08 obj_03)
    (pred_5 obj_08)
    (pred_1 obj_02)
    (pred_6 obj_02 obj_13)
    (pred_1 obj_12)
    (pred_6 obj_12 obj_13)
    (pred_1 obj_06)
    (pred_6 obj_06 obj_13)
    (pred_2 obj_11 obj_03)
    (pred_2 obj_05 obj_13)
    (pred_2 obj_03 obj_01)
    (pred_2 obj_01 obj_04)
    (pred_2 obj_04 obj_05)
)
 (:goal
  (and
   (pred_3 obj_02)
   (pred_3 obj_12)
   (pred_3 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_02)) (not (pred_3 obj_12))))
    (forall (?m - type_3) (at-most-once (pred_6 ?m obj_11)))
  )
)
)
