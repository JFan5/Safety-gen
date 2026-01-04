; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1087939024 --problem-name spanner-s3-n3-l4-s1087939024
(define (problem spanner-s3-n3-l4-s1087939024)
 (:domain spanner)
 (:objects 
     obj_13 - type_5
     obj_09 obj_12 obj_11 - type_4
     obj_07 obj_10 obj_03 - type_3
     obj_05 obj_04 obj_08 obj_01 - type_2
     obj_02 obj_06 - type_2
    )
 (:init 
    (pred_3 obj_13 obj_02)
    (pred_3 obj_09 obj_08)
    (pred_5 obj_09)
    (pred_3 obj_12 obj_08)
    (pred_5 obj_12)
    (pred_3 obj_11 obj_04)
    (pred_5 obj_11)
    (pred_2 obj_07)
    (pred_3 obj_07 obj_06)
    (pred_2 obj_10)
    (pred_3 obj_10 obj_06)
    (pred_2 obj_03)
    (pred_3 obj_03 obj_06)
    (pred_6 obj_02 obj_05)
    (pred_6 obj_01 obj_06)
    (pred_6 obj_05 obj_04)
    (pred_6 obj_04 obj_08)
    (pred_6 obj_08 obj_01)
)
 (:goal
  (and
   (pred_4 obj_07)
   (pred_4 obj_10)
   (pred_4 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_10)) (not (pred_4 obj_03))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_02)))
  )
)
)
