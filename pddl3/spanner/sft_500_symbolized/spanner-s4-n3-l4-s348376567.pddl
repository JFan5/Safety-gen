; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 348376567 --problem-name spanner-s4-n3-l4-s348376567
(define (problem spanner-s4-n3-l4-s348376567)
 (:domain spanner)
 (:objects 
     obj_13 - type_4
     obj_06 obj_14 obj_09 obj_04 - type_1
     obj_12 obj_08 obj_02 - type_2
     obj_10 obj_11 obj_01 obj_07 - type_5
     obj_03 obj_05 - type_5
    )
 (:init 
    (pred_2 obj_13 obj_03)
    (pred_2 obj_06 obj_11)
    (pred_4 obj_06)
    (pred_2 obj_14 obj_01)
    (pred_4 obj_14)
    (pred_2 obj_09 obj_11)
    (pred_4 obj_09)
    (pred_2 obj_04 obj_01)
    (pred_4 obj_04)
    (pred_1 obj_12)
    (pred_2 obj_12 obj_05)
    (pred_1 obj_08)
    (pred_2 obj_08 obj_05)
    (pred_1 obj_02)
    (pred_2 obj_02 obj_05)
    (pred_3 obj_03 obj_10)
    (pred_3 obj_07 obj_05)
    (pred_3 obj_10 obj_11)
    (pred_3 obj_11 obj_01)
    (pred_3 obj_01 obj_07)
)
 (:goal
  (and
   (pred_6 obj_12)
   (pred_6 obj_08)
   (pred_6 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_12)) (not (pred_6 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_03)))
  )
)
)
