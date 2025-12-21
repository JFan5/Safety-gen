; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 846782846 --problem-name spanner-s4-n3-l4-s846782846
(define (problem spanner-s4-n3-l4-s846782846)
 (:domain spanner)
 (:objects 
     obj_05 - type_3
     obj_02 obj_08 obj_07 obj_01 - type_5
     obj_13 obj_03 obj_09 - type_4
     obj_04 obj_12 obj_14 obj_06 - type_2
     obj_10 obj_11 - type_2
    )
 (:init 
    (pred_2 obj_05 obj_10)
    (pred_2 obj_02 obj_12)
    (pred_1 obj_02)
    (pred_2 obj_08 obj_04)
    (pred_1 obj_08)
    (pred_2 obj_07 obj_12)
    (pred_1 obj_07)
    (pred_2 obj_01 obj_14)
    (pred_1 obj_01)
    (pred_5 obj_13)
    (pred_2 obj_13 obj_11)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_11)
    (pred_5 obj_09)
    (pred_2 obj_09 obj_11)
    (pred_6 obj_10 obj_04)
    (pred_6 obj_06 obj_11)
    (pred_6 obj_04 obj_12)
    (pred_6 obj_12 obj_14)
    (pred_6 obj_14 obj_06)
)
 (:goal
  (and
   (pred_3 obj_13)
   (pred_3 obj_03)
   (pred_3 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_13)) (not (pred_3 obj_03))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
