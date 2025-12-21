; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1213145559 --problem-name spanner-s4-n3-l4-s1213145559
(define (problem spanner-s4-n3-l4-s1213145559)
 (:domain spanner)
 (:objects 
     obj_02 - type_3
     obj_10 obj_09 obj_04 obj_11 - type_5
     obj_12 obj_14 obj_05 - type_4
     obj_03 obj_08 obj_01 obj_07 - type_2
     obj_06 obj_13 - type_2
    )
 (:init 
    (pred_2 obj_02 obj_06)
    (pred_2 obj_10 obj_07)
    (pred_1 obj_10)
    (pred_2 obj_09 obj_07)
    (pred_1 obj_09)
    (pred_2 obj_04 obj_07)
    (pred_1 obj_04)
    (pred_2 obj_11 obj_07)
    (pred_1 obj_11)
    (pred_5 obj_12)
    (pred_2 obj_12 obj_13)
    (pred_5 obj_14)
    (pred_2 obj_14 obj_13)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_13)
    (pred_6 obj_06 obj_03)
    (pred_6 obj_07 obj_13)
    (pred_6 obj_03 obj_08)
    (pred_6 obj_08 obj_01)
    (pred_6 obj_01 obj_07)
)
 (:goal
  (and
   (pred_3 obj_12)
   (pred_3 obj_14)
   (pred_3 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_14)) (not (pred_3 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_06)))
  )
)
)
