; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 348376567 --problem-name spanner-s4-n3-l4-s348376567
(define (problem spanner-s4-n3-l4-s348376567)
 (:domain spanner)
 (:objects 
     obj_07 - type_4
     obj_02 obj_05 obj_09 obj_08 - type_5
     obj_13 obj_04 obj_01 - type_1
     obj_14 obj_06 obj_12 obj_10 - type_3
     obj_11 obj_03 - type_3
    )
 (:init 
    (pred_3 obj_07 obj_11)
    (pred_3 obj_02 obj_06)
    (pred_1 obj_02)
    (pred_3 obj_05 obj_12)
    (pred_1 obj_05)
    (pred_3 obj_09 obj_06)
    (pred_1 obj_09)
    (pred_3 obj_08 obj_12)
    (pred_1 obj_08)
    (pred_5 obj_13)
    (pred_3 obj_13 obj_03)
    (pred_5 obj_04)
    (pred_3 obj_04 obj_03)
    (pred_5 obj_01)
    (pred_3 obj_01 obj_03)
    (pred_4 obj_11 obj_14)
    (pred_4 obj_10 obj_03)
    (pred_4 obj_14 obj_06)
    (pred_4 obj_06 obj_12)
    (pred_4 obj_12 obj_10)
)
 (:goal
  (and
   (pred_2 obj_13)
   (pred_2 obj_04)
   (pred_2 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_13)) (not (pred_2 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
