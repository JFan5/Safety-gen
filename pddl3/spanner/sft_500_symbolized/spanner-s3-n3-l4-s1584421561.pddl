; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1584421561 --problem-name spanner-s3-n3-l4-s1584421561
(define (problem spanner-s3-n3-l4-s1584421561)
 (:domain spanner)
 (:objects 
     obj_13 - type_5
     obj_07 obj_11 obj_01 - type_2
     obj_04 obj_03 obj_02 - type_3
     obj_08 obj_05 obj_09 obj_06 - type_4
     obj_12 obj_10 - type_4
    )
 (:init 
    (pred_6 obj_13 obj_12)
    (pred_6 obj_07 obj_05)
    (pred_2 obj_07)
    (pred_6 obj_11 obj_06)
    (pred_2 obj_11)
    (pred_6 obj_01 obj_09)
    (pred_2 obj_01)
    (pred_4 obj_04)
    (pred_6 obj_04 obj_10)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_10)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_10)
    (pred_5 obj_12 obj_08)
    (pred_5 obj_06 obj_10)
    (pred_5 obj_08 obj_05)
    (pred_5 obj_05 obj_09)
    (pred_5 obj_09 obj_06)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_03)
   (pred_1 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_04)) (not (pred_1 obj_03))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
