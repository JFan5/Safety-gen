; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1154020523 --problem-name spanner-s4-n3-l4-s1154020523
(define (problem spanner-s4-n3-l4-s1154020523)
 (:domain spanner)
 (:objects 
     obj_10 - type_1
     obj_08 obj_09 obj_13 obj_03 - type_3
     obj_14 obj_11 obj_02 - type_2
     obj_06 obj_07 obj_01 obj_05 - type_5
     obj_12 obj_04 - type_5
    )
 (:init 
    (pred_6 obj_10 obj_12)
    (pred_6 obj_08 obj_06)
    (pred_1 obj_08)
    (pred_6 obj_09 obj_05)
    (pred_1 obj_09)
    (pred_6 obj_13 obj_07)
    (pred_1 obj_13)
    (pred_6 obj_03 obj_06)
    (pred_1 obj_03)
    (pred_3 obj_14)
    (pred_6 obj_14 obj_04)
    (pred_3 obj_11)
    (pred_6 obj_11 obj_04)
    (pred_3 obj_02)
    (pred_6 obj_02 obj_04)
    (pred_4 obj_12 obj_06)
    (pred_4 obj_05 obj_04)
    (pred_4 obj_06 obj_07)
    (pred_4 obj_07 obj_01)
    (pred_4 obj_01 obj_05)
)
 (:goal
  (and
   (pred_2 obj_14)
   (pred_2 obj_11)
   (pred_2 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_14)) (not (pred_2 obj_11))))
    (forall (?m - type_1) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
