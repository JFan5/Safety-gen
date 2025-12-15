; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1213145559 --problem-name spanner-s4-n3-l4-s1213145559
(define (problem spanner-s4-n3-l4-s1213145559)
 (:domain spanner)
 (:objects 
     obj_04 - type_1
     obj_10 obj_12 obj_02 obj_08 - type_2
     obj_01 obj_07 obj_13 - type_4
     obj_11 obj_03 obj_14 obj_06 - type_3
     obj_05 obj_09 - type_3
    )
 (:init 
    (pred_5 obj_04 obj_05)
    (pred_5 obj_10 obj_06)
    (pred_2 obj_10)
    (pred_5 obj_12 obj_06)
    (pred_2 obj_12)
    (pred_5 obj_02 obj_06)
    (pred_2 obj_02)
    (pred_5 obj_08 obj_06)
    (pred_2 obj_08)
    (pred_3 obj_01)
    (pred_5 obj_01 obj_09)
    (pred_3 obj_07)
    (pred_5 obj_07 obj_09)
    (pred_3 obj_13)
    (pred_5 obj_13 obj_09)
    (pred_4 obj_05 obj_11)
    (pred_4 obj_06 obj_09)
    (pred_4 obj_11 obj_03)
    (pred_4 obj_03 obj_14)
    (pred_4 obj_14 obj_06)
)
 (:goal
  (and
   (pred_6 obj_01)
   (pred_6 obj_07)
   (pred_6 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_07)) (not (pred_6 obj_13))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_05)))
  )
)
)
