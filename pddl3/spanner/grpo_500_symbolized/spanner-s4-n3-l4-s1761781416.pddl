; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1761781416 --problem-name spanner-s4-n3-l4-s1761781416
(define (problem spanner-s4-n3-l4-s1761781416)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_09 obj_06 obj_05 obj_13 - type_5
     obj_11 obj_07 obj_12 - type_1
     obj_14 obj_08 obj_04 obj_02 - type_3
     obj_03 obj_10 - type_3
    )
 (:init 
    (pred_3 obj_01 obj_03)
    (pred_3 obj_09 obj_08)
    (pred_1 obj_09)
    (pred_3 obj_06 obj_14)
    (pred_1 obj_06)
    (pred_3 obj_05 obj_04)
    (pred_1 obj_05)
    (pred_3 obj_13 obj_04)
    (pred_1 obj_13)
    (pred_5 obj_11)
    (pred_3 obj_11 obj_10)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_10)
    (pred_5 obj_12)
    (pred_3 obj_12 obj_10)
    (pred_4 obj_03 obj_14)
    (pred_4 obj_02 obj_10)
    (pred_4 obj_14 obj_08)
    (pred_4 obj_08 obj_04)
    (pred_4 obj_04 obj_02)
)
 (:goal
  (and
   (pred_2 obj_11)
   (pred_2 obj_07)
   (pred_2 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_11)) (not (pred_2 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_03)))
  )
)
)
