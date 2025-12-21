; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1703875557 --problem-name spanner-s4-n3-l4-s1703875557
(define (problem spanner-s4-n3-l4-s1703875557)
 (:domain spanner)
 (:objects 
     obj_12 - type_3
     obj_08 obj_01 obj_07 obj_02 - type_5
     obj_09 obj_11 obj_14 - type_4
     obj_10 obj_04 obj_13 obj_05 - type_2
     obj_03 obj_06 - type_2
    )
 (:init 
    (pred_2 obj_12 obj_03)
    (pred_2 obj_08 obj_10)
    (pred_1 obj_08)
    (pred_2 obj_01 obj_13)
    (pred_1 obj_01)
    (pred_2 obj_07 obj_13)
    (pred_1 obj_07)
    (pred_2 obj_02 obj_10)
    (pred_1 obj_02)
    (pred_5 obj_09)
    (pred_2 obj_09 obj_06)
    (pred_5 obj_11)
    (pred_2 obj_11 obj_06)
    (pred_5 obj_14)
    (pred_2 obj_14 obj_06)
    (pred_6 obj_03 obj_10)
    (pred_6 obj_05 obj_06)
    (pred_6 obj_10 obj_04)
    (pred_6 obj_04 obj_13)
    (pred_6 obj_13 obj_05)
)
 (:goal
  (and
   (pred_3 obj_09)
   (pred_3 obj_11)
   (pred_3 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_09)) (not (pred_3 obj_11))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_03)))
  )
)
)
