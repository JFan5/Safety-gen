; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1400807581 --problem-name spanner-s4-n3-l4-s1400807581
(define (problem spanner-s4-n3-l4-s1400807581)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_07 obj_05 obj_02 obj_04 - type_5
     obj_11 obj_13 obj_03 - type_1
     obj_10 obj_14 obj_06 obj_12 - type_2
     obj_09 obj_01 - type_2
    )
 (:init 
    (pred_3 obj_08 obj_09)
    (pred_3 obj_07 obj_14)
    (pred_1 obj_07)
    (pred_3 obj_05 obj_10)
    (pred_1 obj_05)
    (pred_3 obj_02 obj_12)
    (pred_1 obj_02)
    (pred_3 obj_04 obj_06)
    (pred_1 obj_04)
    (pred_5 obj_11)
    (pred_3 obj_11 obj_01)
    (pred_5 obj_13)
    (pred_3 obj_13 obj_01)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_01)
    (pred_6 obj_09 obj_10)
    (pred_6 obj_12 obj_01)
    (pred_6 obj_10 obj_14)
    (pred_6 obj_14 obj_06)
    (pred_6 obj_06 obj_12)
)
 (:goal
  (and
   (pred_2 obj_11)
   (pred_2 obj_13)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_11)) (not (pred_2 obj_13))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_09)))
  )
)
)
