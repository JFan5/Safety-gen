; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1703875557 --problem-name spanner-s4-n3-l4-s1703875557
(define (problem spanner-s4-n3-l4-s1703875557)
 (:domain spanner)
 (:objects 
     obj_11 - type_5
     obj_07 obj_03 obj_06 obj_13 - type_4
     obj_14 obj_08 obj_04 - type_2
     obj_02 obj_09 obj_01 obj_12 - type_1
     obj_10 obj_05 - type_1
    )
 (:init 
    (pred_3 obj_11 obj_10)
    (pred_3 obj_07 obj_02)
    (pred_4 obj_07)
    (pred_3 obj_03 obj_01)
    (pred_4 obj_03)
    (pred_3 obj_06 obj_01)
    (pred_4 obj_06)
    (pred_3 obj_13 obj_02)
    (pred_4 obj_13)
    (pred_2 obj_14)
    (pred_3 obj_14 obj_05)
    (pred_2 obj_08)
    (pred_3 obj_08 obj_05)
    (pred_2 obj_04)
    (pred_3 obj_04 obj_05)
    (pred_1 obj_10 obj_02)
    (pred_1 obj_12 obj_05)
    (pred_1 obj_02 obj_09)
    (pred_1 obj_09 obj_01)
    (pred_1 obj_01 obj_12)
)
 (:goal
  (and
   (pred_5 obj_14)
   (pred_5 obj_08)
   (pred_5 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_14)) (not (pred_5 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
