; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1480402990 --problem-name spanner-s3-n3-l4-s1480402990
(define (problem spanner-s3-n3-l4-s1480402990)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_11 obj_02 obj_12 - type_1
     obj_09 obj_03 obj_04 - type_2
     obj_13 obj_01 obj_07 obj_06 - type_3
     obj_05 obj_08 - type_3
    )
 (:init 
    (pred_6 obj_10 obj_05)
    (pred_6 obj_11 obj_13)
    (pred_3 obj_11)
    (pred_6 obj_02 obj_07)
    (pred_3 obj_02)
    (pred_6 obj_12 obj_07)
    (pred_3 obj_12)
    (pred_1 obj_09)
    (pred_6 obj_09 obj_08)
    (pred_1 obj_03)
    (pred_6 obj_03 obj_08)
    (pred_1 obj_04)
    (pred_6 obj_04 obj_08)
    (pred_2 obj_05 obj_13)
    (pred_2 obj_06 obj_08)
    (pred_2 obj_13 obj_01)
    (pred_2 obj_01 obj_07)
    (pred_2 obj_07 obj_06)
)
 (:goal
  (and
   (pred_4 obj_09)
   (pred_4 obj_03)
   (pred_4 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_09)) (not (pred_4 obj_03))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_05)))
  )
)
)
