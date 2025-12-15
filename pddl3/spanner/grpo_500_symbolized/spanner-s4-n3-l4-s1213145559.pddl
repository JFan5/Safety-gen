; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1213145559 --problem-name spanner-s4-n3-l4-s1213145559
(define (problem spanner-s4-n3-l4-s1213145559)
 (:domain spanner)
 (:objects 
     obj_13 - type_4
     obj_02 obj_08 obj_11 obj_03 - type_5
     obj_09 obj_04 obj_06 - type_1
     obj_07 obj_10 obj_01 obj_14 - type_3
     obj_12 obj_05 - type_3
    )
 (:init 
    (pred_3 obj_13 obj_12)
    (pred_3 obj_02 obj_14)
    (pred_1 obj_02)
    (pred_3 obj_08 obj_14)
    (pred_1 obj_08)
    (pred_3 obj_11 obj_14)
    (pred_1 obj_11)
    (pred_3 obj_03 obj_14)
    (pred_1 obj_03)
    (pred_5 obj_09)
    (pred_3 obj_09 obj_05)
    (pred_5 obj_04)
    (pred_3 obj_04 obj_05)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_05)
    (pred_4 obj_12 obj_07)
    (pred_4 obj_14 obj_05)
    (pred_4 obj_07 obj_10)
    (pred_4 obj_10 obj_01)
    (pred_4 obj_01 obj_14)
)
 (:goal
  (and
   (pred_2 obj_09)
   (pred_2 obj_04)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_04)) (not (pred_2 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_12)))
  )
)
)
