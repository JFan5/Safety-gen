; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1565793902 --problem-name spanner-s4-n3-l4-s1565793902
(define (problem spanner-s4-n3-l4-s1565793902)
 (:domain spanner)
 (:objects 
     obj_04 - type_2
     obj_14 obj_02 obj_11 obj_07 - type_1
     obj_03 obj_08 obj_12 - type_3
     obj_13 obj_10 obj_09 obj_01 - type_4
     obj_05 obj_06 - type_4
    )
 (:init 
    (pred_6 obj_04 obj_05)
    (pred_6 obj_14 obj_10)
    (pred_4 obj_14)
    (pred_6 obj_02 obj_01)
    (pred_4 obj_02)
    (pred_6 obj_11 obj_10)
    (pred_4 obj_11)
    (pred_6 obj_07 obj_13)
    (pred_4 obj_07)
    (pred_2 obj_03)
    (pred_6 obj_03 obj_06)
    (pred_2 obj_08)
    (pred_6 obj_08 obj_06)
    (pred_2 obj_12)
    (pred_6 obj_12 obj_06)
    (pred_5 obj_05 obj_13)
    (pred_5 obj_01 obj_06)
    (pred_5 obj_13 obj_10)
    (pred_5 obj_10 obj_09)
    (pred_5 obj_09 obj_01)
)
 (:goal
  (and
   (pred_3 obj_03)
   (pred_3 obj_08)
   (pred_3 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_03)) (not (pred_3 obj_08))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_05)))
  )
)
)
