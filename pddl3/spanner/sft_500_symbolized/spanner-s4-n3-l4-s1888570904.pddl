; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1888570904 --problem-name spanner-s4-n3-l4-s1888570904
(define (problem spanner-s4-n3-l4-s1888570904)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_10 obj_04 obj_12 obj_07 - type_2
     obj_08 obj_09 obj_01 - type_5
     obj_11 obj_03 obj_13 obj_14 - type_4
     obj_05 obj_02 - type_4
    )
 (:init 
    (pred_4 obj_06 obj_05)
    (pred_4 obj_10 obj_13)
    (pred_5 obj_10)
    (pred_4 obj_04 obj_11)
    (pred_5 obj_04)
    (pred_4 obj_12 obj_13)
    (pred_5 obj_12)
    (pred_4 obj_07 obj_13)
    (pred_5 obj_07)
    (pred_1 obj_08)
    (pred_4 obj_08 obj_02)
    (pred_1 obj_09)
    (pred_4 obj_09 obj_02)
    (pred_1 obj_01)
    (pred_4 obj_01 obj_02)
    (pred_3 obj_05 obj_11)
    (pred_3 obj_14 obj_02)
    (pred_3 obj_11 obj_03)
    (pred_3 obj_03 obj_13)
    (pred_3 obj_13 obj_14)
)
 (:goal
  (and
   (pred_6 obj_08)
   (pred_6 obj_09)
   (pred_6 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_09)) (not (pred_6 obj_01))))
    (forall (?m - type_1) (at-most-once (pred_4 ?m obj_05)))
  )
)
)
