; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 187220400 --problem-name spanner-s4-n3-l4-s187220400
(define (problem spanner-s4-n3-l4-s187220400)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_01 obj_09 obj_06 obj_14 - type_5
     obj_02 obj_10 obj_13 - type_1
     obj_03 obj_12 obj_08 obj_11 - type_3
     obj_04 obj_07 - type_3
    )
 (:init 
    (pred_3 obj_05 obj_04)
    (pred_3 obj_01 obj_08)
    (pred_1 obj_01)
    (pred_3 obj_09 obj_08)
    (pred_1 obj_09)
    (pred_3 obj_06 obj_12)
    (pred_1 obj_06)
    (pred_3 obj_14 obj_08)
    (pred_1 obj_14)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_07)
    (pred_5 obj_10)
    (pred_3 obj_10 obj_07)
    (pred_5 obj_13)
    (pred_3 obj_13 obj_07)
    (pred_4 obj_04 obj_03)
    (pred_4 obj_11 obj_07)
    (pred_4 obj_03 obj_12)
    (pred_4 obj_12 obj_08)
    (pred_4 obj_08 obj_11)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_10)
   (pred_2 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_10)) (not (pred_2 obj_13))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_04)))
  )
)
)
