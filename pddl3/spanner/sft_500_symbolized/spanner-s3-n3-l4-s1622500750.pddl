; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1622500750 --problem-name spanner-s3-n3-l4-s1622500750
(define (problem spanner-s3-n3-l4-s1622500750)
 (:domain spanner)
 (:objects 
     obj_10 - type_3
     obj_08 obj_05 obj_03 - type_4
     obj_11 obj_01 obj_04 - type_1
     obj_07 obj_09 obj_06 obj_13 - type_2
     obj_12 obj_02 - type_2
    )
 (:init 
    (pred_1 obj_10 obj_12)
    (pred_1 obj_08 obj_09)
    (pred_3 obj_08)
    (pred_1 obj_05 obj_13)
    (pred_3 obj_05)
    (pred_1 obj_03 obj_06)
    (pred_3 obj_03)
    (pred_5 obj_11)
    (pred_1 obj_11 obj_02)
    (pred_5 obj_01)
    (pred_1 obj_01 obj_02)
    (pred_5 obj_04)
    (pred_1 obj_04 obj_02)
    (pred_2 obj_12 obj_07)
    (pred_2 obj_13 obj_02)
    (pred_2 obj_07 obj_09)
    (pred_2 obj_09 obj_06)
    (pred_2 obj_06 obj_13)
)
 (:goal
  (and
   (pred_6 obj_11)
   (pred_6 obj_01)
   (pred_6 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_11)) (not (pred_6 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_12)))
  )
)
)
