; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1584421561 --problem-name spanner-s3-n3-l4-s1584421561
(define (problem spanner-s3-n3-l4-s1584421561)
 (:domain spanner)
 (:objects 
     obj_08 - type_1
     obj_04 obj_05 obj_03 - type_5
     obj_07 obj_13 obj_06 - type_3
     obj_10 obj_09 obj_12 obj_01 - type_4
     obj_02 obj_11 - type_4
    )
 (:init 
    (pred_3 obj_08 obj_02)
    (pred_3 obj_04 obj_09)
    (pred_1 obj_04)
    (pred_3 obj_05 obj_01)
    (pred_1 obj_05)
    (pred_3 obj_03 obj_12)
    (pred_1 obj_03)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_11)
    (pred_5 obj_13)
    (pred_3 obj_13 obj_11)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_11)
    (pred_6 obj_02 obj_10)
    (pred_6 obj_01 obj_11)
    (pred_6 obj_10 obj_09)
    (pred_6 obj_09 obj_12)
    (pred_6 obj_12 obj_01)
)
 (:goal
  (and
   (pred_2 obj_07)
   (pred_2 obj_13)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_07)) (not (pred_2 obj_13))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_02)))
  )
)
)
