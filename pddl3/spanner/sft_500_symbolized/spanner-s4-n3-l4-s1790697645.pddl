; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1790697645 --problem-name spanner-s4-n3-l4-s1790697645
(define (problem spanner-s4-n3-l4-s1790697645)
 (:domain spanner)
 (:objects 
     obj_03 - type_1
     obj_08 obj_11 obj_06 obj_10 - type_2
     obj_01 obj_12 obj_09 - type_4
     obj_07 obj_04 obj_02 obj_14 - type_5
     obj_05 obj_13 - type_5
    )
 (:init 
    (pred_1 obj_03 obj_05)
    (pred_1 obj_08 obj_07)
    (pred_5 obj_08)
    (pred_1 obj_11 obj_14)
    (pred_5 obj_11)
    (pred_1 obj_06 obj_07)
    (pred_5 obj_06)
    (pred_1 obj_10 obj_02)
    (pred_5 obj_10)
    (pred_2 obj_01)
    (pred_1 obj_01 obj_13)
    (pred_2 obj_12)
    (pred_1 obj_12 obj_13)
    (pred_2 obj_09)
    (pred_1 obj_09 obj_13)
    (pred_3 obj_05 obj_07)
    (pred_3 obj_14 obj_13)
    (pred_3 obj_07 obj_04)
    (pred_3 obj_04 obj_02)
    (pred_3 obj_02 obj_14)
)
 (:goal
  (and
   (pred_4 obj_01)
   (pred_4 obj_12)
   (pred_4 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_01)) (not (pred_4 obj_12))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_05)))
  )
)
)
