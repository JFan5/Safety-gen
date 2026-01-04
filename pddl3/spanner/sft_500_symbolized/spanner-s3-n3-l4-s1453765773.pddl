; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1453765773 --problem-name spanner-s3-n3-l4-s1453765773
(define (problem spanner-s3-n3-l4-s1453765773)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_05 obj_11 obj_04 - type_2
     obj_12 obj_06 obj_03 - type_3
     obj_07 obj_08 obj_13 obj_09 - type_4
     obj_01 obj_10 - type_4
    )
 (:init 
    (pred_3 obj_02 obj_01)
    (pred_3 obj_05 obj_07)
    (pred_1 obj_05)
    (pred_3 obj_11 obj_08)
    (pred_1 obj_11)
    (pred_3 obj_04 obj_07)
    (pred_1 obj_04)
    (pred_4 obj_12)
    (pred_3 obj_12 obj_10)
    (pred_4 obj_06)
    (pred_3 obj_06 obj_10)
    (pred_4 obj_03)
    (pred_3 obj_03 obj_10)
    (pred_6 obj_01 obj_07)
    (pred_6 obj_09 obj_10)
    (pred_6 obj_07 obj_08)
    (pred_6 obj_08 obj_13)
    (pred_6 obj_13 obj_09)
)
 (:goal
  (and
   (pred_5 obj_12)
   (pred_5 obj_06)
   (pred_5 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_12)) (not (pred_5 obj_06))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_01)))
  )
)
)
