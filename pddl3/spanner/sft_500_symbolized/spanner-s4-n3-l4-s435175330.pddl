; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 435175330 --problem-name spanner-s4-n3-l4-s435175330
(define (problem spanner-s4-n3-l4-s435175330)
 (:domain spanner)
 (:objects 
     obj_01 - type_1
     obj_02 obj_12 obj_03 obj_14 - type_3
     obj_08 obj_11 obj_13 - type_5
     obj_05 obj_04 obj_07 obj_06 - type_2
     obj_10 obj_09 - type_2
    )
 (:init 
    (pred_5 obj_01 obj_10)
    (pred_5 obj_02 obj_07)
    (pred_4 obj_02)
    (pred_5 obj_12 obj_04)
    (pred_4 obj_12)
    (pred_5 obj_03 obj_07)
    (pred_4 obj_03)
    (pred_5 obj_14 obj_07)
    (pred_4 obj_14)
    (pred_6 obj_08)
    (pred_5 obj_08 obj_09)
    (pred_6 obj_11)
    (pred_5 obj_11 obj_09)
    (pred_6 obj_13)
    (pred_5 obj_13 obj_09)
    (pred_1 obj_10 obj_05)
    (pred_1 obj_06 obj_09)
    (pred_1 obj_05 obj_04)
    (pred_1 obj_04 obj_07)
    (pred_1 obj_07 obj_06)
)
 (:goal
  (and
   (pred_2 obj_08)
   (pred_2 obj_11)
   (pred_2 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_11)) (not (pred_2 obj_13))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_10)))
  )
)
)
