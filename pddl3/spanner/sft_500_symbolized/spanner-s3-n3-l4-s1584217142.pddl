; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1584217142 --problem-name spanner-s3-n3-l4-s1584217142
(define (problem spanner-s3-n3-l4-s1584217142)
 (:domain spanner)
 (:objects 
     obj_07 - type_1
     obj_01 obj_08 obj_13 - type_5
     obj_02 obj_10 obj_12 - type_4
     obj_09 obj_06 obj_11 obj_03 - type_2
     obj_05 obj_04 - type_2
    )
 (:init 
    (pred_1 obj_07 obj_05)
    (pred_1 obj_01 obj_09)
    (pred_3 obj_01)
    (pred_1 obj_08 obj_11)
    (pred_3 obj_08)
    (pred_1 obj_13 obj_11)
    (pred_3 obj_13)
    (pred_4 obj_02)
    (pred_1 obj_02 obj_04)
    (pred_4 obj_10)
    (pred_1 obj_10 obj_04)
    (pred_4 obj_12)
    (pred_1 obj_12 obj_04)
    (pred_5 obj_05 obj_09)
    (pred_5 obj_03 obj_04)
    (pred_5 obj_09 obj_06)
    (pred_5 obj_06 obj_11)
    (pred_5 obj_11 obj_03)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_10)
   (pred_2 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_10))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_05)))
  )
)
)
