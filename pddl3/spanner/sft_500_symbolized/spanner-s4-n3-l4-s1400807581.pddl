; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1400807581 --problem-name spanner-s4-n3-l4-s1400807581
(define (problem spanner-s4-n3-l4-s1400807581)
 (:domain spanner)
 (:objects 
     obj_13 - type_4
     obj_01 obj_03 obj_02 obj_08 - type_1
     obj_14 obj_04 obj_07 - type_5
     obj_11 obj_10 obj_05 obj_09 - type_3
     obj_06 obj_12 - type_3
    )
 (:init 
    (pred_2 obj_13 obj_06)
    (pred_2 obj_01 obj_10)
    (pred_3 obj_01)
    (pred_2 obj_03 obj_11)
    (pred_3 obj_03)
    (pred_2 obj_02 obj_09)
    (pred_3 obj_02)
    (pred_2 obj_08 obj_05)
    (pred_3 obj_08)
    (pred_1 obj_14)
    (pred_2 obj_14 obj_12)
    (pred_1 obj_04)
    (pred_2 obj_04 obj_12)
    (pred_1 obj_07)
    (pred_2 obj_07 obj_12)
    (pred_6 obj_06 obj_11)
    (pred_6 obj_09 obj_12)
    (pred_6 obj_11 obj_10)
    (pred_6 obj_10 obj_05)
    (pred_6 obj_05 obj_09)
)
 (:goal
  (and
   (pred_4 obj_14)
   (pred_4 obj_04)
   (pred_4 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_14)) (not (pred_4 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_06)))
  )
)
)
