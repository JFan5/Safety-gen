; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1565793902 --problem-name spanner-s4-n3-l4-s1565793902
(define (problem spanner-s4-n3-l4-s1565793902)
 (:domain spanner)
 (:objects 
     obj_04 - type_1
     obj_02 obj_08 obj_07 obj_11 - type_3
     obj_01 obj_13 obj_03 - type_2
     obj_06 obj_14 obj_12 obj_05 - type_4
     obj_10 obj_09 - type_4
    )
 (:init 
    (pred_4 obj_04 obj_10)
    (pred_4 obj_02 obj_14)
    (pred_6 obj_02)
    (pred_4 obj_08 obj_05)
    (pred_6 obj_08)
    (pred_4 obj_07 obj_14)
    (pred_6 obj_07)
    (pred_4 obj_11 obj_06)
    (pred_6 obj_11)
    (pred_1 obj_01)
    (pred_4 obj_01 obj_09)
    (pred_1 obj_13)
    (pred_4 obj_13 obj_09)
    (pred_1 obj_03)
    (pred_4 obj_03 obj_09)
    (pred_3 obj_10 obj_06)
    (pred_3 obj_05 obj_09)
    (pred_3 obj_06 obj_14)
    (pred_3 obj_14 obj_12)
    (pred_3 obj_12 obj_05)
)
 (:goal
  (and
   (pred_5 obj_01)
   (pred_5 obj_13)
   (pred_5 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_01)) (not (pred_5 obj_13))))
    (forall (?m - type_1) (at-most-once (pred_4 ?m obj_10)))
  )
)
)
