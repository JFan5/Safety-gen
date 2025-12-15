; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1703875557 --problem-name spanner-s4-n3-l4-s1703875557
(define (problem spanner-s4-n3-l4-s1703875557)
 (:domain spanner)
 (:objects 
     obj_05 - type_2
     obj_12 obj_03 obj_01 obj_09 - type_4
     obj_07 obj_14 obj_02 - type_1
     obj_04 obj_08 obj_10 obj_06 - type_3
     obj_13 obj_11 - type_3
    )
 (:init 
    (pred_4 obj_05 obj_13)
    (pred_4 obj_12 obj_04)
    (pred_5 obj_12)
    (pred_4 obj_03 obj_10)
    (pred_5 obj_03)
    (pred_4 obj_01 obj_10)
    (pred_5 obj_01)
    (pred_4 obj_09 obj_04)
    (pred_5 obj_09)
    (pred_2 obj_07)
    (pred_4 obj_07 obj_11)
    (pred_2 obj_14)
    (pred_4 obj_14 obj_11)
    (pred_2 obj_02)
    (pred_4 obj_02 obj_11)
    (pred_6 obj_13 obj_04)
    (pred_6 obj_06 obj_11)
    (pred_6 obj_04 obj_08)
    (pred_6 obj_08 obj_10)
    (pred_6 obj_10 obj_06)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_14)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_14))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_13)))
  )
)
)
