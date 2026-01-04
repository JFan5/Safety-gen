; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1761781416 --problem-name spanner-s4-n3-l4-s1761781416
(define (problem spanner-s4-n3-l4-s1761781416)
 (:domain spanner)
 (:objects 
     obj_12 - type_3
     obj_06 obj_04 obj_09 obj_07 - type_1
     obj_13 obj_08 obj_02 - type_4
     obj_05 obj_01 obj_11 obj_10 - type_5
     obj_14 obj_03 - type_5
    )
 (:init 
    (pred_3 obj_12 obj_14)
    (pred_3 obj_06 obj_01)
    (pred_5 obj_06)
    (pred_3 obj_04 obj_05)
    (pred_5 obj_04)
    (pred_3 obj_09 obj_11)
    (pred_5 obj_09)
    (pred_3 obj_07 obj_11)
    (pred_5 obj_07)
    (pred_6 obj_13)
    (pred_3 obj_13 obj_03)
    (pred_6 obj_08)
    (pred_3 obj_08 obj_03)
    (pred_6 obj_02)
    (pred_3 obj_02 obj_03)
    (pred_4 obj_14 obj_05)
    (pred_4 obj_10 obj_03)
    (pred_4 obj_05 obj_01)
    (pred_4 obj_01 obj_11)
    (pred_4 obj_11 obj_10)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_08)
   (pred_1 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_08))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_14)))
  )
)
)
