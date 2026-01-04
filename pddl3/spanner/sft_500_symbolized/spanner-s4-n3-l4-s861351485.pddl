; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 861351485 --problem-name spanner-s4-n3-l4-s861351485
(define (problem spanner-s4-n3-l4-s861351485)
 (:domain spanner)
 (:objects 
     obj_12 - type_5
     obj_13 obj_14 obj_03 obj_07 - type_2
     obj_02 obj_04 obj_05 - type_1
     obj_08 obj_01 obj_09 obj_11 - type_4
     obj_10 obj_06 - type_4
    )
 (:init 
    (pred_2 obj_12 obj_10)
    (pred_2 obj_13 obj_08)
    (pred_1 obj_13)
    (pred_2 obj_14 obj_08)
    (pred_1 obj_14)
    (pred_2 obj_03 obj_11)
    (pred_1 obj_03)
    (pred_2 obj_07 obj_01)
    (pred_1 obj_07)
    (pred_3 obj_02)
    (pred_2 obj_02 obj_06)
    (pred_3 obj_04)
    (pred_2 obj_04 obj_06)
    (pred_3 obj_05)
    (pred_2 obj_05 obj_06)
    (pred_5 obj_10 obj_08)
    (pred_5 obj_11 obj_06)
    (pred_5 obj_08 obj_01)
    (pred_5 obj_01 obj_09)
    (pred_5 obj_09 obj_11)
)
 (:goal
  (and
   (pred_6 obj_02)
   (pred_6 obj_04)
   (pred_6 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_02)) (not (pred_6 obj_04))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
