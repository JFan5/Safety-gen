; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1703875557 --problem-name spanner-s4-n3-l4-s1703875557
(define (problem spanner-s4-n3-l4-s1703875557)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_08 obj_02 obj_09 obj_03 - type_5
     obj_13 obj_01 obj_12 - type_1
     obj_06 obj_11 obj_07 obj_05 - type_3
     obj_04 obj_14 - type_3
    )
 (:init 
    (pred_3 obj_10 obj_04)
    (pred_3 obj_08 obj_06)
    (pred_1 obj_08)
    (pred_3 obj_02 obj_07)
    (pred_1 obj_02)
    (pred_3 obj_09 obj_07)
    (pred_1 obj_09)
    (pred_3 obj_03 obj_06)
    (pred_1 obj_03)
    (pred_5 obj_13)
    (pred_3 obj_13 obj_14)
    (pred_5 obj_01)
    (pred_3 obj_01 obj_14)
    (pred_5 obj_12)
    (pred_3 obj_12 obj_14)
    (pred_4 obj_04 obj_06)
    (pred_4 obj_05 obj_14)
    (pred_4 obj_06 obj_11)
    (pred_4 obj_11 obj_07)
    (pred_4 obj_07 obj_05)
)
 (:goal
  (and
   (pred_2 obj_13)
   (pred_2 obj_01)
   (pred_2 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_13)) (not (pred_2 obj_01))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_04)))
  )
)
)
