; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 2076159253 --problem-name spanner-s4-n3-l4-s2076159253
(define (problem spanner-s4-n3-l4-s2076159253)
 (:domain spanner)
 (:objects 
     obj_10 - type_1
     obj_04 obj_08 obj_11 obj_06 - type_2
     obj_09 obj_03 obj_13 - type_5
     obj_07 obj_02 obj_05 obj_12 - type_3
     obj_01 obj_14 - type_3
    )
 (:init 
    (pred_1 obj_10 obj_01)
    (pred_1 obj_04 obj_05)
    (pred_5 obj_04)
    (pred_1 obj_08 obj_07)
    (pred_5 obj_08)
    (pred_1 obj_11 obj_07)
    (pred_5 obj_11)
    (pred_1 obj_06 obj_07)
    (pred_5 obj_06)
    (pred_2 obj_09)
    (pred_1 obj_09 obj_14)
    (pred_2 obj_03)
    (pred_1 obj_03 obj_14)
    (pred_2 obj_13)
    (pred_1 obj_13 obj_14)
    (pred_6 obj_01 obj_07)
    (pred_6 obj_12 obj_14)
    (pred_6 obj_07 obj_02)
    (pred_6 obj_02 obj_05)
    (pred_6 obj_05 obj_12)
)
 (:goal
  (and
   (pred_3 obj_09)
   (pred_3 obj_03)
   (pred_3 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_03)) (not (pred_3 obj_13))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_01)))
  )
)
)
