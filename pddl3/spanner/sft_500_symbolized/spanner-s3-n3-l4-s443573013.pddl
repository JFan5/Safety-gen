; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 443573013 --problem-name spanner-s3-n3-l4-s443573013
(define (problem spanner-s3-n3-l4-s443573013)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_01 obj_02 obj_11 - type_3
     obj_10 obj_05 obj_13 - type_1
     obj_06 obj_03 obj_08 obj_07 - type_4
     obj_12 obj_04 - type_4
    )
 (:init 
    (pred_4 obj_09 obj_12)
    (pred_4 obj_01 obj_03)
    (pred_6 obj_01)
    (pred_4 obj_02 obj_07)
    (pred_6 obj_02)
    (pred_4 obj_11 obj_06)
    (pred_6 obj_11)
    (pred_5 obj_10)
    (pred_4 obj_10 obj_04)
    (pred_5 obj_05)
    (pred_4 obj_05 obj_04)
    (pred_5 obj_13)
    (pred_4 obj_13 obj_04)
    (pred_2 obj_12 obj_06)
    (pred_2 obj_07 obj_04)
    (pred_2 obj_06 obj_03)
    (pred_2 obj_03 obj_08)
    (pred_2 obj_08 obj_07)
)
 (:goal
  (and
   (pred_3 obj_10)
   (pred_3 obj_05)
   (pred_3 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_10)) (not (pred_3 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_12)))
  )
)
)
