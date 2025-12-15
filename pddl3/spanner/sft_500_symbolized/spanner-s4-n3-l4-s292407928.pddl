; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 292407928 --problem-name spanner-s4-n3-l4-s292407928
(define (problem spanner-s4-n3-l4-s292407928)
 (:domain spanner)
 (:objects 
     obj_09 - type_2
     obj_05 obj_10 obj_03 obj_12 - type_1
     obj_14 obj_04 obj_11 - type_3
     obj_01 obj_13 obj_08 obj_07 - type_4
     obj_06 obj_02 - type_4
    )
 (:init 
    (pred_3 obj_09 obj_06)
    (pred_3 obj_05 obj_08)
    (pred_5 obj_05)
    (pred_3 obj_10 obj_07)
    (pred_5 obj_10)
    (pred_3 obj_03 obj_13)
    (pred_5 obj_03)
    (pred_3 obj_12 obj_01)
    (pred_5 obj_12)
    (pred_4 obj_14)
    (pred_3 obj_14 obj_02)
    (pred_4 obj_04)
    (pred_3 obj_04 obj_02)
    (pred_4 obj_11)
    (pred_3 obj_11 obj_02)
    (pred_2 obj_06 obj_01)
    (pred_2 obj_07 obj_02)
    (pred_2 obj_01 obj_13)
    (pred_2 obj_13 obj_08)
    (pred_2 obj_08 obj_07)
)
 (:goal
  (and
   (pred_6 obj_14)
   (pred_6 obj_04)
   (pred_6 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_04)) (not (pred_6 obj_11))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_06)))
  )
)
)
