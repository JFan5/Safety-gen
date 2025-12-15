; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 382458855 --problem-name spanner-s4-n3-l4-s382458855
(define (problem spanner-s4-n3-l4-s382458855)
 (:domain spanner)
 (:objects 
     obj_14 - type_5
     obj_05 obj_12 obj_11 obj_06 - type_2
     obj_08 obj_09 obj_04 - type_4
     obj_03 obj_13 obj_02 obj_01 - type_1
     obj_10 obj_07 - type_1
    )
 (:init 
    (pred_2 obj_14 obj_10)
    (pred_2 obj_05 obj_02)
    (pred_4 obj_05)
    (pred_2 obj_12 obj_01)
    (pred_4 obj_12)
    (pred_2 obj_11 obj_03)
    (pred_4 obj_11)
    (pred_2 obj_06 obj_03)
    (pred_4 obj_06)
    (pred_3 obj_08)
    (pred_2 obj_08 obj_07)
    (pred_3 obj_09)
    (pred_2 obj_09 obj_07)
    (pred_3 obj_04)
    (pred_2 obj_04 obj_07)
    (pred_1 obj_10 obj_03)
    (pred_1 obj_01 obj_07)
    (pred_1 obj_03 obj_13)
    (pred_1 obj_13 obj_02)
    (pred_1 obj_02 obj_01)
)
 (:goal
  (and
   (pred_5 obj_08)
   (pred_5 obj_09)
   (pred_5 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_09)) (not (pred_5 obj_04))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
