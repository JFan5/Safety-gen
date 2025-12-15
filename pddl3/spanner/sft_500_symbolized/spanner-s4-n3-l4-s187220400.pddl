; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 187220400 --problem-name spanner-s4-n3-l4-s187220400
(define (problem spanner-s4-n3-l4-s187220400)
 (:domain spanner)
 (:objects 
     obj_13 - type_3
     obj_12 obj_02 obj_14 obj_05 - type_5
     obj_11 obj_08 obj_09 - type_1
     obj_10 obj_07 obj_06 obj_01 - type_2
     obj_04 obj_03 - type_2
    )
 (:init 
    (pred_2 obj_13 obj_04)
    (pred_2 obj_12 obj_06)
    (pred_4 obj_12)
    (pred_2 obj_02 obj_06)
    (pred_4 obj_02)
    (pred_2 obj_14 obj_07)
    (pred_4 obj_14)
    (pred_2 obj_05 obj_06)
    (pred_4 obj_05)
    (pred_3 obj_11)
    (pred_2 obj_11 obj_03)
    (pred_3 obj_08)
    (pred_2 obj_08 obj_03)
    (pred_3 obj_09)
    (pred_2 obj_09 obj_03)
    (pred_5 obj_04 obj_10)
    (pred_5 obj_01 obj_03)
    (pred_5 obj_10 obj_07)
    (pred_5 obj_07 obj_06)
    (pred_5 obj_06 obj_01)
)
 (:goal
  (and
   (pred_1 obj_11)
   (pred_1 obj_08)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_08)) (not (pred_1 obj_09))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_04)))
  )
)
)
