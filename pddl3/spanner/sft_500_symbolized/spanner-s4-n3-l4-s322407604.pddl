; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 322407604 --problem-name spanner-s4-n3-l4-s322407604
(define (problem spanner-s4-n3-l4-s322407604)
 (:domain spanner)
 (:objects 
     obj_11 - type_2
     obj_03 obj_01 obj_02 obj_05 - type_5
     obj_14 obj_08 obj_04 - type_4
     obj_07 obj_10 obj_09 obj_12 - type_1
     obj_13 obj_06 - type_1
    )
 (:init 
    (pred_4 obj_11 obj_13)
    (pred_4 obj_03 obj_09)
    (pred_3 obj_03)
    (pred_4 obj_01 obj_10)
    (pred_3 obj_01)
    (pred_4 obj_02 obj_09)
    (pred_3 obj_02)
    (pred_4 obj_05 obj_10)
    (pred_3 obj_05)
    (pred_5 obj_14)
    (pred_4 obj_14 obj_06)
    (pred_5 obj_08)
    (pred_4 obj_08 obj_06)
    (pred_5 obj_04)
    (pred_4 obj_04 obj_06)
    (pred_6 obj_13 obj_07)
    (pred_6 obj_12 obj_06)
    (pred_6 obj_07 obj_10)
    (pred_6 obj_10 obj_09)
    (pred_6 obj_09 obj_12)
)
 (:goal
  (and
   (pred_1 obj_14)
   (pred_1 obj_08)
   (pred_1 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_08)) (not (pred_1 obj_04))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_13)))
  )
)
)
