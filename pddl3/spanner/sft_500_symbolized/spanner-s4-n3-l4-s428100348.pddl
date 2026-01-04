; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 428100348 --problem-name spanner-s4-n3-l4-s428100348
(define (problem spanner-s4-n3-l4-s428100348)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_03 obj_05 obj_04 obj_01 - type_2
     obj_10 obj_11 obj_09 - type_1
     obj_13 obj_14 obj_07 obj_12 - type_5
     obj_02 obj_06 - type_5
    )
 (:init 
    (pred_6 obj_08 obj_02)
    (pred_6 obj_03 obj_13)
    (pred_1 obj_03)
    (pred_6 obj_05 obj_07)
    (pred_1 obj_05)
    (pred_6 obj_04 obj_14)
    (pred_1 obj_04)
    (pred_6 obj_01 obj_07)
    (pred_1 obj_01)
    (pred_3 obj_10)
    (pred_6 obj_10 obj_06)
    (pred_3 obj_11)
    (pred_6 obj_11 obj_06)
    (pred_3 obj_09)
    (pred_6 obj_09 obj_06)
    (pred_4 obj_02 obj_13)
    (pred_4 obj_12 obj_06)
    (pred_4 obj_13 obj_14)
    (pred_4 obj_14 obj_07)
    (pred_4 obj_07 obj_12)
)
 (:goal
  (and
   (pred_5 obj_10)
   (pred_5 obj_11)
   (pred_5 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_10)) (not (pred_5 obj_11))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_02)))
  )
)
)
