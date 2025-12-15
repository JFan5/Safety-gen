; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1241467654 --problem-name spanner-s4-n3-l4-s1241467654
(define (problem spanner-s4-n3-l4-s1241467654)
 (:domain spanner)
 (:objects 
     obj_04 - type_5
     obj_13 obj_10 obj_11 obj_09 - type_3
     obj_03 obj_14 obj_06 - type_2
     obj_02 obj_12 obj_07 obj_08 - type_1
     obj_05 obj_01 - type_1
    )
 (:init 
    (pred_2 obj_04 obj_05)
    (pred_2 obj_13 obj_02)
    (pred_6 obj_13)
    (pred_2 obj_10 obj_07)
    (pred_6 obj_10)
    (pred_2 obj_11 obj_07)
    (pred_6 obj_11)
    (pred_2 obj_09 obj_12)
    (pred_6 obj_09)
    (pred_3 obj_03)
    (pred_2 obj_03 obj_01)
    (pred_3 obj_14)
    (pred_2 obj_14 obj_01)
    (pred_3 obj_06)
    (pred_2 obj_06 obj_01)
    (pred_5 obj_05 obj_02)
    (pred_5 obj_08 obj_01)
    (pred_5 obj_02 obj_12)
    (pred_5 obj_12 obj_07)
    (pred_5 obj_07 obj_08)
)
 (:goal
  (and
   (pred_1 obj_03)
   (pred_1 obj_14)
   (pred_1 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_03)) (not (pred_1 obj_14))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_05)))
  )
)
)
