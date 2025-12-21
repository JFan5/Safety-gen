; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 428100348 --problem-name spanner-s4-n3-l4-s428100348
(define (problem spanner-s4-n3-l4-s428100348)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_08 obj_02 obj_11 obj_06 - type_3
     obj_04 obj_10 obj_07 - type_1
     obj_13 obj_14 obj_09 obj_01 - type_2
     obj_03 obj_12 - type_2
    )
 (:init 
    (pred_6 obj_05 obj_03)
    (pred_6 obj_08 obj_13)
    (pred_5 obj_08)
    (pred_6 obj_02 obj_09)
    (pred_5 obj_02)
    (pred_6 obj_11 obj_14)
    (pred_5 obj_11)
    (pred_6 obj_06 obj_09)
    (pred_5 obj_06)
    (pred_4 obj_04)
    (pred_6 obj_04 obj_12)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_12)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_12)
    (pred_3 obj_03 obj_13)
    (pred_3 obj_01 obj_12)
    (pred_3 obj_13 obj_14)
    (pred_3 obj_14 obj_09)
    (pred_3 obj_09 obj_01)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_10)
   (pred_1 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_04)) (not (pred_1 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
