; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 915142580 --problem-name spanner-s3-n2-l4-s915142580
(define (problem spanner-s3-n2-l4-s915142580)
 (:domain spanner)
 (:objects 
     obj_10 - type_5
     obj_07 obj_11 obj_01 - type_3
     obj_06 obj_03 - type_1
     obj_08 obj_05 obj_04 obj_02 - type_2
     obj_12 obj_09 - type_2
    )
 (:init 
    (pred_6 obj_10 obj_12)
    (pred_6 obj_07 obj_08)
    (pred_5 obj_07)
    (pred_6 obj_11 obj_04)
    (pred_5 obj_11)
    (pred_6 obj_01 obj_05)
    (pred_5 obj_01)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_09)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_09)
    (pred_3 obj_12 obj_08)
    (pred_3 obj_02 obj_09)
    (pred_3 obj_08 obj_05)
    (pred_3 obj_05 obj_04)
    (pred_3 obj_04 obj_02)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_06)) (not (pred_1 obj_03))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
