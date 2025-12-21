; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 187220400 --problem-name spanner-s4-n3-l4-s187220400
(define (problem spanner-s4-n3-l4-s187220400)
 (:domain spanner)
 (:objects 
     obj_12 - type_3
     obj_14 obj_10 obj_09 obj_13 - type_5
     obj_01 obj_02 obj_06 - type_4
     obj_11 obj_08 obj_05 obj_07 - type_2
     obj_03 obj_04 - type_2
    )
 (:init 
    (pred_2 obj_12 obj_03)
    (pred_2 obj_14 obj_05)
    (pred_1 obj_14)
    (pred_2 obj_10 obj_05)
    (pred_1 obj_10)
    (pred_2 obj_09 obj_08)
    (pred_1 obj_09)
    (pred_2 obj_13 obj_05)
    (pred_1 obj_13)
    (pred_5 obj_01)
    (pred_2 obj_01 obj_04)
    (pred_5 obj_02)
    (pred_2 obj_02 obj_04)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_04)
    (pred_6 obj_03 obj_11)
    (pred_6 obj_07 obj_04)
    (pred_6 obj_11 obj_08)
    (pred_6 obj_08 obj_05)
    (pred_6 obj_05 obj_07)
)
 (:goal
  (and
   (pred_3 obj_01)
   (pred_3 obj_02)
   (pred_3 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_02)) (not (pred_3 obj_06))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_03)))
  )
)
)
