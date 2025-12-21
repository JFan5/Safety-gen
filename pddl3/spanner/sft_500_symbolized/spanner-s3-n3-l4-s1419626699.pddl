; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1419626699 --problem-name spanner-s3-n3-l4-s1419626699
(define (problem spanner-s3-n3-l4-s1419626699)
 (:domain spanner)
 (:objects 
     obj_06 - type_3
     obj_02 obj_09 obj_03 - type_5
     obj_01 obj_04 obj_12 - type_4
     obj_07 obj_10 obj_05 obj_08 - type_2
     obj_13 obj_11 - type_2
    )
 (:init 
    (pred_2 obj_06 obj_13)
    (pred_2 obj_02 obj_05)
    (pred_1 obj_02)
    (pred_2 obj_09 obj_07)
    (pred_1 obj_09)
    (pred_2 obj_03 obj_07)
    (pred_1 obj_03)
    (pred_5 obj_01)
    (pred_2 obj_01 obj_11)
    (pred_5 obj_04)
    (pred_2 obj_04 obj_11)
    (pred_5 obj_12)
    (pred_2 obj_12 obj_11)
    (pred_6 obj_13 obj_07)
    (pred_6 obj_08 obj_11)
    (pred_6 obj_07 obj_10)
    (pred_6 obj_10 obj_05)
    (pred_6 obj_05 obj_08)
)
 (:goal
  (and
   (pred_3 obj_01)
   (pred_3 obj_04)
   (pred_3 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_04)) (not (pred_3 obj_12))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_13)))
  )
)
)
