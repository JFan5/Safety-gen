; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 187220400 --problem-name spanner-s4-n3-l4-s187220400
(define (problem spanner-s4-n3-l4-s187220400)
 (:domain spanner)
 (:objects 
     obj_13 - type_5
     obj_02 obj_12 obj_07 obj_06 - type_2
     obj_10 obj_04 obj_08 - type_3
     obj_11 obj_01 obj_14 obj_05 - type_4
     obj_03 obj_09 - type_4
    )
 (:init 
    (pred_5 obj_13 obj_03)
    (pred_5 obj_02 obj_14)
    (pred_2 obj_02)
    (pred_5 obj_12 obj_14)
    (pred_2 obj_12)
    (pred_5 obj_07 obj_01)
    (pred_2 obj_07)
    (pred_5 obj_06 obj_14)
    (pred_2 obj_06)
    (pred_6 obj_10)
    (pred_5 obj_10 obj_09)
    (pred_6 obj_04)
    (pred_5 obj_04 obj_09)
    (pred_6 obj_08)
    (pred_5 obj_08 obj_09)
    (pred_4 obj_03 obj_11)
    (pred_4 obj_05 obj_09)
    (pred_4 obj_11 obj_01)
    (pred_4 obj_01 obj_14)
    (pred_4 obj_14 obj_05)
)
 (:goal
  (and
   (pred_1 obj_10)
   (pred_1 obj_04)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_04)) (not (pred_1 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_03)))
  )
)
)
