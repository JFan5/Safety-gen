; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 2004720793 --problem-name spanner-s4-n3-l4-s2004720793
(define (problem spanner-s4-n3-l4-s2004720793)
 (:domain spanner)
 (:objects 
     obj_11 - type_2
     obj_04 obj_14 obj_03 obj_08 - type_4
     obj_13 obj_07 obj_09 - type_5
     obj_01 obj_12 obj_02 obj_10 - type_3
     obj_06 obj_05 - type_3
    )
 (:init 
    (pred_1 obj_11 obj_06)
    (pred_1 obj_04 obj_02)
    (pred_6 obj_04)
    (pred_1 obj_14 obj_01)
    (pred_6 obj_14)
    (pred_1 obj_03 obj_12)
    (pred_6 obj_03)
    (pred_1 obj_08 obj_01)
    (pred_6 obj_08)
    (pred_2 obj_13)
    (pred_1 obj_13 obj_05)
    (pred_2 obj_07)
    (pred_1 obj_07 obj_05)
    (pred_2 obj_09)
    (pred_1 obj_09 obj_05)
    (pred_5 obj_06 obj_01)
    (pred_5 obj_10 obj_05)
    (pred_5 obj_01 obj_12)
    (pred_5 obj_12 obj_02)
    (pred_5 obj_02 obj_10)
)
 (:goal
  (and
   (pred_3 obj_13)
   (pred_3 obj_07)
   (pred_3 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_09))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_06)))
  )
)
)
