; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 428100348 --problem-name spanner-s4-n3-l4-s428100348
(define (problem spanner-s4-n3-l4-s428100348)
 (:domain spanner)
 (:objects 
     obj_14 - type_2
     obj_01 obj_03 obj_02 obj_06 - type_3
     obj_12 obj_10 obj_04 - type_4
     obj_05 obj_11 obj_13 obj_07 - type_5
     obj_08 obj_09 - type_5
    )
 (:init 
    (pred_4 obj_14 obj_08)
    (pred_4 obj_01 obj_05)
    (pred_6 obj_01)
    (pred_4 obj_03 obj_13)
    (pred_6 obj_03)
    (pred_4 obj_02 obj_11)
    (pred_6 obj_02)
    (pred_4 obj_06 obj_13)
    (pred_6 obj_06)
    (pred_5 obj_12)
    (pred_4 obj_12 obj_09)
    (pred_5 obj_10)
    (pred_4 obj_10 obj_09)
    (pred_5 obj_04)
    (pred_4 obj_04 obj_09)
    (pred_3 obj_08 obj_05)
    (pred_3 obj_07 obj_09)
    (pred_3 obj_05 obj_11)
    (pred_3 obj_11 obj_13)
    (pred_3 obj_13 obj_07)
)
 (:goal
  (and
   (pred_1 obj_12)
   (pred_1 obj_10)
   (pred_1 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_12)) (not (pred_1 obj_10))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_08)))
  )
)
)
