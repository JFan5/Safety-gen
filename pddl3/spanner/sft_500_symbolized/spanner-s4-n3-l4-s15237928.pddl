; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 15237928 --problem-name spanner-s4-n3-l4-s15237928
(define (problem spanner-s4-n3-l4-s15237928)
 (:domain spanner)
 (:objects 
     obj_14 - type_3
     obj_05 obj_12 obj_13 obj_08 - type_5
     obj_07 obj_04 obj_03 - type_1
     obj_10 obj_02 obj_11 obj_09 - type_2
     obj_06 obj_01 - type_2
    )
 (:init 
    (pred_2 obj_14 obj_06)
    (pred_2 obj_05 obj_10)
    (pred_6 obj_05)
    (pred_2 obj_12 obj_11)
    (pred_6 obj_12)
    (pred_2 obj_13 obj_02)
    (pred_6 obj_13)
    (pred_2 obj_08 obj_11)
    (pred_6 obj_08)
    (pred_4 obj_07)
    (pred_2 obj_07 obj_01)
    (pred_4 obj_04)
    (pred_2 obj_04 obj_01)
    (pred_4 obj_03)
    (pred_2 obj_03 obj_01)
    (pred_1 obj_06 obj_10)
    (pred_1 obj_09 obj_01)
    (pred_1 obj_10 obj_02)
    (pred_1 obj_02 obj_11)
    (pred_1 obj_11 obj_09)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_04)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_06)))
  )
)
)
