; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 435175330 --problem-name spanner-s4-n3-l4-s435175330
(define (problem spanner-s4-n3-l4-s435175330)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_11 obj_12 obj_10 obj_13 - type_5
     obj_04 obj_06 obj_05 - type_4
     obj_02 obj_08 obj_01 obj_03 - type_2
     obj_09 obj_14 - type_2
    )
 (:init 
    (pred_2 obj_07 obj_09)
    (pred_2 obj_11 obj_01)
    (pred_1 obj_11)
    (pred_2 obj_12 obj_08)
    (pred_1 obj_12)
    (pred_2 obj_10 obj_01)
    (pred_1 obj_10)
    (pred_2 obj_13 obj_01)
    (pred_1 obj_13)
    (pred_5 obj_04)
    (pred_2 obj_04 obj_14)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_14)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_14)
    (pred_6 obj_09 obj_02)
    (pred_6 obj_03 obj_14)
    (pred_6 obj_02 obj_08)
    (pred_6 obj_08 obj_01)
    (pred_6 obj_01 obj_03)
)
 (:goal
  (and
   (pred_3 obj_04)
   (pred_3 obj_06)
   (pred_3 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
