; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1790697645 --problem-name spanner-s4-n3-l4-s1790697645
(define (problem spanner-s4-n3-l4-s1790697645)
 (:domain spanner)
 (:objects 
     obj_11 - type_5
     obj_05 obj_14 obj_08 obj_13 - type_4
     obj_12 obj_09 obj_02 - type_1
     obj_10 obj_07 obj_06 obj_03 - type_3
     obj_04 obj_01 - type_3
    )
 (:init 
    (pred_6 obj_11 obj_04)
    (pred_6 obj_05 obj_10)
    (pred_3 obj_05)
    (pred_6 obj_14 obj_03)
    (pred_3 obj_14)
    (pred_6 obj_08 obj_10)
    (pred_3 obj_08)
    (pred_6 obj_13 obj_06)
    (pred_3 obj_13)
    (pred_2 obj_12)
    (pred_6 obj_12 obj_01)
    (pred_2 obj_09)
    (pred_6 obj_09 obj_01)
    (pred_2 obj_02)
    (pred_6 obj_02 obj_01)
    (pred_1 obj_04 obj_10)
    (pred_1 obj_03 obj_01)
    (pred_1 obj_10 obj_07)
    (pred_1 obj_07 obj_06)
    (pred_1 obj_06 obj_03)
)
 (:goal
  (and
   (pred_4 obj_12)
   (pred_4 obj_09)
   (pred_4 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_12)) (not (pred_4 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_04)))
  )
)
)
