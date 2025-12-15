; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 905430018 --problem-name spanner-s3-n3-l4-s905430018
(define (problem spanner-s3-n3-l4-s905430018)
 (:domain spanner)
 (:objects 
     obj_02 - type_3
     obj_10 obj_06 obj_12 - type_4
     obj_07 obj_04 obj_01 - type_5
     obj_03 obj_05 obj_08 obj_09 - type_2
     obj_11 obj_13 - type_2
    )
 (:init 
    (pred_4 obj_02 obj_11)
    (pred_4 obj_10 obj_08)
    (pred_6 obj_10)
    (pred_4 obj_06 obj_03)
    (pred_6 obj_06)
    (pred_4 obj_12 obj_08)
    (pred_6 obj_12)
    (pred_3 obj_07)
    (pred_4 obj_07 obj_13)
    (pred_3 obj_04)
    (pred_4 obj_04 obj_13)
    (pred_3 obj_01)
    (pred_4 obj_01 obj_13)
    (pred_5 obj_11 obj_03)
    (pred_5 obj_09 obj_13)
    (pred_5 obj_03 obj_05)
    (pred_5 obj_05 obj_08)
    (pred_5 obj_08 obj_09)
)
 (:goal
  (and
   (pred_2 obj_07)
   (pred_2 obj_04)
   (pred_2 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_04)) (not (pred_2 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_4 ?m obj_11)))
  )
)
)
