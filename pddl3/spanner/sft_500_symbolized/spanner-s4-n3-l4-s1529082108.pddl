; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1529082108 --problem-name spanner-s4-n3-l4-s1529082108
(define (problem spanner-s4-n3-l4-s1529082108)
 (:domain spanner)
 (:objects 
     obj_02 - type_4
     obj_05 obj_08 obj_14 obj_01 - type_2
     obj_03 obj_13 obj_07 - type_1
     obj_06 obj_04 obj_09 obj_10 - type_5
     obj_11 obj_12 - type_5
    )
 (:init 
    (pred_2 obj_02 obj_11)
    (pred_2 obj_05 obj_06)
    (pred_3 obj_05)
    (pred_2 obj_08 obj_04)
    (pred_3 obj_08)
    (pred_2 obj_14 obj_10)
    (pred_3 obj_14)
    (pred_2 obj_01 obj_09)
    (pred_3 obj_01)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_12)
    (pred_5 obj_13)
    (pred_2 obj_13 obj_12)
    (pred_5 obj_07)
    (pred_2 obj_07 obj_12)
    (pred_6 obj_11 obj_06)
    (pred_6 obj_10 obj_12)
    (pred_6 obj_06 obj_04)
    (pred_6 obj_04 obj_09)
    (pred_6 obj_09 obj_10)
)
 (:goal
  (and
   (pred_1 obj_03)
   (pred_1 obj_13)
   (pred_1 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_03)) (not (pred_1 obj_13))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_11)))
  )
)
)
