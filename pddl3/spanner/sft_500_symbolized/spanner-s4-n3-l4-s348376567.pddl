; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 348376567 --problem-name spanner-s4-n3-l4-s348376567
(define (problem spanner-s4-n3-l4-s348376567)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_03 obj_05 obj_01 obj_13 - type_2
     obj_04 obj_06 obj_11 - type_1
     obj_10 obj_07 obj_14 obj_12 - type_4
     obj_08 obj_09 - type_4
    )
 (:init 
    (pred_1 obj_02 obj_08)
    (pred_1 obj_03 obj_07)
    (pred_2 obj_03)
    (pred_1 obj_05 obj_14)
    (pred_2 obj_05)
    (pred_1 obj_01 obj_07)
    (pred_2 obj_01)
    (pred_1 obj_13 obj_14)
    (pred_2 obj_13)
    (pred_5 obj_04)
    (pred_1 obj_04 obj_09)
    (pred_5 obj_06)
    (pred_1 obj_06 obj_09)
    (pred_5 obj_11)
    (pred_1 obj_11 obj_09)
    (pred_3 obj_08 obj_10)
    (pred_3 obj_12 obj_09)
    (pred_3 obj_10 obj_07)
    (pred_3 obj_07 obj_14)
    (pred_3 obj_14 obj_12)
)
 (:goal
  (and
   (pred_6 obj_04)
   (pred_6 obj_06)
   (pred_6 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_04)) (not (pred_6 obj_06))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_08)))
  )
)
)
